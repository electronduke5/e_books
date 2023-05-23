import 'package:e_books/presentation/cubits/models_status.dart';
import 'package:e_books/presentation/cubits/profile/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/user.dart';
import '../cubits/theme/theme_cubit.dart';
import '../di/app_module.dart';
import '../widgets/popup_icon_item.dart';
import '../widgets/profile_stats_grid.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isMyProfile = true;

  User? user;

  @override
  Widget build(BuildContext context) {
    user = (ModalRoute.of(context)?.settings.arguments as User?) ??
        AppModule.getProfileHolder().user;
    setState(() {
      if ((ModalRoute.of(context)?.settings.arguments as User?) != null) {
        context.read<ProfileCubit>().loadProfile(user: user, isFromApi: true);
        if (user?.id != AppModule.getProfileHolder().user.id) {
          isMyProfile = false;
        }
      }
    });
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<ProfileCubit>().loadProfile(user: user, isFromApi: true);
      },
      child: SizedBox(
        height: isMyProfile
            ? MediaQuery.of(context).size.height - 80
            : MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              switch (state.status.runtimeType) {
                case LoadedStatus<User>:
                  if (state.status.item!.id == AppModule.getProfileHolder().user.id) {
                    isMyProfile = true;
                    user = state.status.item!;
                  }
                  return Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: isMyProfile ? 210 : 250,
                          child: Card(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            margin: EdgeInsets.zero,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        minRadius: 2,
                                        maxRadius: 45,
                                        child: Text(
                                          state.status.item!.getInitials(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 30),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        '${state.status.item!.surname}\n${state.status.item!.name}',
                                        style: Theme.of(context).textTheme.headlineSmall,
                                      ),
                                      const Spacer(),
                                      () {
                                        if (isMyProfile) {
                                          return popupProfileMenu(context);
                                        } else {
                                          return const SizedBox();
                                        }
                                      }(),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Divider(
                                    thickness: 2,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.color
                                        ?.withOpacity(0.2),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Никнейм: ${state.status.item!.username}',
                                    style: Theme.of(context).textTheme.titleLarge,
                                  ),
                                  Text(
                                    'Эл. почта: ${state.status.item!.email}',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  () {
                                    if (!isMyProfile) {
                                      //return BlocBuilder<ProfileCubit, ProfileState>(
                                        //builder: (context, state) {
                                          return ElevatedButton(
                                            onPressed: () async {
                                              await context
                                                  .read<ProfileCubit>()
                                                  .subscribe(state.status.item!).then((value) => AppModule.getProfileHolder().user = value?? AppModule.getProfileHolder().user);
                                            },
                                            child: (){
                                              print('AppModule.getProfileHolder().user.subscriptions!.contains(user): ${AppModule.getProfileHolder().user.subscriptions!.contains(user)}');
                                              print('${AppModule.getProfileHolder().user.subscriptions}');
                                              print('$user');
                                              if(AppModule.getProfileHolder().user.subscriptions!.contains(user)){
                                                return const Text('Отписаться');
                                              }
                                              if(state.subscribeStatus is LoadedStatus){
                                                return state.subscribeStatus.item!.subscriptions!.contains(user)?  const Text('Отписаться') :  const Text('Подписаться');
                                              }
                                              return const Text('Подписаться');

                                            }(),
                                          );
                                        //}
                                      //);
                                    } else {
                                      return const SizedBox();
                                    }
                                  }(),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        ProfileStatsGrid(user: state.status.item!),
                      ],
                    ),
                  );
                case LoadingStatus<User>:
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                case FailedStatus<User>:
                  return Center(
                      child: Text(state.status.message ?? 'Failed load profile'));
                default:
                  return const Center(child: Text('Default'));
              }
            },
          ),
        ),
      ),
    );
  }

  Widget popupProfileMenu(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.more_vert, size: 28),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      itemBuilder: (context) => [
        PopupIconMenuItem(title: 'Редатировать профиль', icon: Icons.edit_outlined),
        PopupIconMenuItem(title: 'Выйти', icon: Icons.exit_to_app_outlined),
        PopupIconMenuItem(
          title: 'Сменить тему',
          icon: context.read<ThemeCubit>().getCurrentTheme == ThemeMode.light
              ? Icons.dark_mode_outlined
              : Icons.light_mode_outlined,
        ),
      ],
      onSelected: (value) {
        switch (value) {
          case 'Редатировать профиль':
            //buildEditProfileWidget(context);
            break;
          case 'Выйти':
            AppModule.getPreferencesRepository().removeSavedProfile();
            Navigator.of(context).pushNamed('/sign-in');
            break;
          case 'Сменить тему':
            context.read<ThemeCubit>().switchTheme();
            break;
        }
      },
    );
  }
}
