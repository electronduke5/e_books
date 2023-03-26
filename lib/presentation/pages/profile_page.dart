import 'package:e_books/presentation/cubits/models_status.dart';
import 'package:e_books/presentation/cubits/profile/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/user.dart';
import '../di/app_module.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<ProfileCubit>().loadProfile();
      },
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            switch (state.status.runtimeType) {
              case LoadedStatus<User>:
                return IntrinsicHeight(
                  child: Column(
                    children: [
                      //(state.status.item!.getFullName()),
                      Text(state.status.item!.email),
                      Text(state.status.item!.username),
                      ElevatedButton(
                          onPressed: () {
                            AppModule.getPreferencesRepository()
                                .removeSavedProfile();
                            Navigator.of(context).pushNamed('/sign-in');
                          },
                          child: Text('Выйти'))
                    ],
                  ),
                );
              case LoadingStatus<User>:
                return const Center(child: CircularProgressIndicator());
              case FailedStatus<User>:
                return Center(
                    child: Text(state.status.message ?? 'Failed load profile'));
              default:
                return const Center(child: Text('Default'));
            }
          },
        ),
      ),
    );
  }
}
