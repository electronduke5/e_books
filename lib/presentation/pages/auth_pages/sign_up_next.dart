import 'package:e_books/presentation/cubits/auth/auth_cubit.dart';
import 'package:e_books/presentation/cubits/models_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/user.dart';

class SignUpNextPage extends StatelessWidget {
  SignUpNextPage({Key? key}) : super(key: key);

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final TextEditingController _usernameController =
      TextEditingController();
  final TextEditingController _emailController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            switch (state.apiStatus.runtimeType) {
              case LoadedStatus<User>:
                showBottomSheet(
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                            'Письмо с подтверждением эл. адреса было отправлено на ${_emailController.value.text}\n'),
                      );
                    });
                Navigator.of(context).pushNamed('/sign-in');
            }
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _key,
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Создание\nнового аккаунта",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Осталось совсем чуть-чуть',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 30),
                            TextFormField(
                              controller: _usernameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Это обязательное поле";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10.0),
                                labelText: 'Никнейм',
                                hintText: 'user01',
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: _emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Это обязательное поле";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10.0),
                                labelText: 'Эл. почта',
                                hintText: 'example@mail.ru',
                              ),
                            ),
                            const SizedBox(height: 20),
                            BlocBuilder<AuthCubit, AuthState>(
                              builder: (context, state) {
                                return ElevatedButton(
                                  onPressed: () {
                                    if (_key.currentState?.validate() ??
                                        false) {
                                      context.read<AuthCubit>().emailChanged(
                                          _emailController.value.text);
                                      context.read<AuthCubit>().usernameChanged(
                                          _usernameController.value.text);
                                      context.read<AuthCubit>().signUp(
                                        role: 1,
                                            email: _emailController.value.text,
                                            surname: data['surname'],
                                            patronymic: data['patronymic'],
                                            name: data['name'],
                                            username:
                                                _usernameController.value.text,
                                          );
                                    }
                                  },
                                  child: const Text('Готово'),
                                );
                              },
                            ),
                            const SizedBox(height: 10),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/sign-in');
                              },
                              child: Text('Уже есть аккаунт'),
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
