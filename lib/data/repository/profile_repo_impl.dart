import 'package:e_books/data/utils/constants.dart';
import 'package:e_books/presentation/di/app_module.dart';

import '../../domain/repository/profile_repository.dart';
import '../api_service.dart';
import '../models/user.dart';

class ProfileRepositoryImpl with ApiService<User> implements ProfileRepository {
  @override
  String apiRoute = ApiConstUrl.userUrl;

  @override
  Future<User> getProfile({User? user}) async {
    final User receivedUser = user == null
        ? AppModule.getProfileHolder().user
        : await get(
            fromJson: (Map<String, dynamic> json) => User.fromJson(json),
            id: user.id);
    print('User from AppModule: ${AppModule.getProfileHolder().user}');
    return receivedUser;
  }

  @override
  Future<User> updateProfile(
      {String? surname,
      String? name,
      String? patronymic,
      String? email,
      String? username}) async {
    return put(
      fromJson: (Map<String, dynamic> json) => User.fromJson(json),
      data: {
        'surname': surname,
        'name': name,
        'patronymic': patronymic,
        'email': email,
        'username': username,
      },
      id: AppModule.getProfileHolder().user.id,
    );
  }
}
