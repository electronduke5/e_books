import '../../data/models/user.dart';

abstract class ProfileRepository {
  Future<User> getProfile({User? user});

  Future<User> updateProfile({
    String? surname,
    String? name,
    String? patronymic,
    String? email,
    String? username,
  });
}
