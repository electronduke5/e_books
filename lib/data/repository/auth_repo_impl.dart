import 'package:e_books/data/api_service.dart';
import 'package:e_books/data/models/user.dart';
import 'package:e_books/domain/repository/auth_repository.dart';

import '../utils/constants.dart';

class AuthRepositoryImpl with ApiService<User> implements AuthRepository {
  @override
  Future<Map<String, dynamic>> sendAuthCode(String email) {
    apiRoute = ApiConstUrl.sendMessageUrl;
    return postMap(data: {
      'email': email,
    });
  }

  @override
  Future<User> signIn(String code, String email, String hash) {
    apiRoute = ApiConstUrl.loginUrl;
    return post(
        fromJson: (Map<String, dynamic> json) => User.fromJson(json),
        data: {
          'code': code,
          'email': email,
          'hash': hash,
        });
  }

  @override
  Future<User> signInByToken(String token) {
    apiRoute = ApiConstUrl.loginByTokenUrl;
    return post(
        fromJson: (Map<String, dynamic> json) => User.fromJson(json),
        data: {
          'token': token,
        });
  }

  @override
  Future<Map<String, dynamic>> signUp({
    required String surname,
    required String name,
    String? patronymic,
    required String username,
    required String email,
    required int role,
  }) {
    apiRoute = ApiConstUrl.registerUrl;
    return postMap(data: {
      'surname': surname,
      'name': name,
      'patronymic': patronymic,
      'username': username,
      'email': email,
      'role_id': role,
    });
  }

  @override
  String apiRoute = ApiConstUrl.registerUrl;
}
