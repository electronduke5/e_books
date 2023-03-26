import '../../data/models/user.dart';

abstract class AuthRepository {
  Future<User> signIn(
    String code,
    String email,
    String hash,
  );

  Future<Map<String, dynamic>> signUp({
    required String surname,
    required String name,
    String? patronymic,
    required String username,
    required String email,
  });

  Future<User> signInByToken(String token);

  Future<Map<String, dynamic>> sendAuthCode(String email);
}
