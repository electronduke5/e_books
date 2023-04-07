import 'package:e_books/presentation/cubits/auth/auth_cubit.dart';
import 'package:e_books/presentation/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _patronymicController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {},
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets
                  .all(20.0),
              child: Form(
                key: _key,
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment
                          .topLeft,
                      child: Text(
                        "Создание\nнового аккаунта",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight
                              .bold,
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets
                            .all(
                            20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .center,
                          children: [
                            const Text(
                              'Давайте знакомиться, \nкак вас зовут?',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight
                                    .bold,
                              ),
                            ),
                            const SizedBox(
                                height: 30),
                            TextFormField(
                              controller: _surnameController,
                              validator: (value) {
                                if (value ==
                                    null ||
                                    value
                                        .isEmpty) {
                                  return "Это обязательное поле";
                                }
                                return null;
                              },
                              keyboardType: TextInputType
                                  .name,
                              decoration: const InputDecoration(
                                contentPadding:
                                EdgeInsets
                                    .symmetric(
                                    horizontal: 10.0),
                                labelText: 'Фамилия',
                                hintText: 'Иванов',
                              ),
                            ),
                            const SizedBox(
                                height: 10),
                            TextFormField(
                              controller: _nameController,
                              validator: (value) {
                                if (value ==
                                    null ||
                                    value
                                        .isEmpty) {
                                  return "Это обязательное поле";
                                }
                                return null;
                              },
                              keyboardType: TextInputType
                                  .name,
                              decoration: const InputDecoration(
                                contentPadding:
                                EdgeInsets
                                    .symmetric(
                                    horizontal: 10.0),
                                labelText: 'Имя',
                                hintText: 'Иван',
                              ),
                            ),
                            const SizedBox(
                                height: 10),
                            TextFormField(
                              controller: _patronymicController,
                              keyboardType: TextInputType
                                  .name,
                              decoration: const InputDecoration(
                                contentPadding:
                                EdgeInsets
                                    .symmetric(
                                    horizontal: 10.0),
                                labelText: 'Отчество',
                                hintText: 'Иванович',
                              ),
                            ),
                            const SizedBox(
                                height: 20),
                            ElevatedButton(
                              onPressed: () {
                                if (_key
                                    .currentState
                                    ?.validate() ??
                                    false) {
                                  context
                                      .read<
                                      AuthCubit>()
                                      .fioChanged(
                                    surname: _surnameController
                                        .value
                                        .text,
                                    name: _nameController
                                        .value
                                        .text,
                                    patronymic:
                                    _patronymicController
                                        .value
                                        .text,
                                  );
                                  Navigator
                                      .of(
                                      context)
                                      .pushNamed(
                                      '/sign-up-next',
                                      arguments: {
                                        'surname': _surnameController
                                            .value
                                            .text,
                                        'name': _nameController
                                            .value
                                            .text,
                                        'patronymic':
                                        _patronymicController
                                            .value
                                            .text,
                                      });
                                }
                              },
                              child: const Text(
                                  'Далее'),
                            ),
                            const SizedBox(
                                height: 10),
                            TextButton(
                              onPressed: () {
                                SnackBarInfo.show(
                                    context: context,
                                    message:
                                        'На вашу почту отправлено письмо для подтверждения почты!',
                                    isSuccess: true);
                                Navigator.of(context).pushNamed('/sign-in');
                              },
                              child: Text(
                                  'Уже есть аккаунт?'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
