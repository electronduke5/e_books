import 'dart:async';

import 'package:e_books/presentation/cubits/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../data/models/user.dart';
import '../../cubits/models_status.dart';
import '../../widgets/snack_bar.dart';

class CodeConfirmPage extends StatefulWidget {
  const CodeConfirmPage({Key? key}) : super(key: key);

  @override
  State<CodeConfirmPage> createState() => _CodeConfirmPageState();
}

class _CodeConfirmPageState extends State<CodeConfirmPage> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  Timer? timer;
  Duration duration = const Duration(seconds: 60);
  bool isTimerCancel = false;
  String inputCode = '';

  String strDigits(int n) => n.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    final seconds = strDigits(duration.inSeconds.remainder(60));
    final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final email = arguments['email'];
    final hash = arguments['hash'];
    return Scaffold(
      body: SafeArea(
        child: BlocListener<AuthCubit,AuthState>(
          listener:(context, state){
            print('status in code_cofirm_page: ${state.apiStatus.runtimeType}');
            switch (state.apiStatus.runtimeType) {
              case FailedStatus<User>:
                SnackBarInfo.show(
                  context: context,
                  message: state.apiStatus.message?.substring(11) ?? 'Неверный логин или пароль',
                  isSuccess: false,
                );
                context
                    .read<AuthCubit>()
                    .state
                    .copyWith(apiStatus: const IdleStatus());
                break;
              case LoadedStatus<User>:
                print('hash in BlocListener: ${state.hash}');
                Navigator.of(context).pushReplacementNamed('/main');
                break;
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Введите проверочный код',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
                child: PinCodeTextField(
                  appContext: context,
                  onChanged: (value) {
                    inputCode = value;
                  },
                  length: 6,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                  ),
                  keyboardType: TextInputType.number,
                  onCompleted: (value) async {
                    debugPrint("Completed");
                    await context.read<AuthCubit>().signIn(
                      hash: hash,
                      email: email,
                      code: inputCode,
                    );
                  },
                ),
              ),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) => Text(
                  "Проверочный код был отправлен на\n ${email ?? 'вашу почту'}",
                  textAlign: TextAlign.center,
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: ElevatedButton(
              //     onPressed: () {},
              //     child: const Text('Дальше'),
              //   ),
              // ),
              () {
                return isTimerCancel
                    ? TextButton(
                        onPressed: () async {
                          await context.read<AuthCubit>().sendAuthCode().then(
                              (value) => Navigator.of(context)
                                  .pushNamed('/codeConfirmPage'));
                          resetTimer();
                        },
                        child: Text('Отправить код ещё раз'))
                    : Text('Повторно отправить код через $seconds секунд', style: TextStyle(color: Theme.of(context).colorScheme.error),);
              }(),
            ],
          ),
        ),
      ),
    );
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) => setCountDown());
  }

  void stopTimer() {
    setState(() => timer!.cancel());
  }

  void resetTimer() {
    stopTimer();
    setState(() => duration = const Duration(seconds: 60));
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = duration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        timer!.cancel();
        isTimerCancel = true;
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }
}
