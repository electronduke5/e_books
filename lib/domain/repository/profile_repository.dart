import '../../data/models/user.dart';

abstract class ProfileRepository {
  Future<User> getProfile({User? user, bool isFromApi = false});

  Future<User> updateProfile({
    String? surname,
    String? name,
    String? patronymic,
    String? email,
    String? username,
  });

  Future<User> subscribeUser({
    required int userId,
    required int authorId
  });
}
