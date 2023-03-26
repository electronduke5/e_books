part of 'auth_cubit.dart';

class AuthState {
  final String surname;
  final String name;
  final String patronymic;
  final String username;
  final String email;
  final String code;
  final String token;
  final String hash;
  final ApiStatus<User> apiStatus;

  AuthState({
    this.apiStatus = const IdleStatus(),
    this.surname = '',
    this.name = '',
    this.patronymic = '',
    this.username = '',
    this.email = '',
    this.code = '',
    this.token = '',
    this.hash = '',
  });

  AuthState copyWith({
    String? surname,
    String? name,
    String? patronymic,
    String? username,
    String? email,
    String? code,
    String? token,
    String? hash,
    ApiStatus<User>? apiStatus,
  }) =>
      AuthState(
        surname: surname ?? this.surname,
        name: name ?? this.name,
        patronymic: patronymic ?? this.patronymic,
        username: username ?? this.username,
        token: token ?? this.token,
        email: email ?? this.email,
        code: code ?? this.code,
        hash: hash ?? this.hash,
        apiStatus: apiStatus ?? this.apiStatus,
      );
}
