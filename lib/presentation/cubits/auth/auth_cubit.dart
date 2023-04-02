import 'package:bloc/bloc.dart';
import 'package:e_books/presentation/di/app_module.dart';

import '../../../data/models/user.dart';
import '../models_status.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState());

  Future<void> signIn({
    required String code,
    required String email,
    required String hash,
  }) async {
    final repository = AppModule.getAuthRepository();
    emit(state.copyWith(apiStatus: LoadingStatus()));
    try {
      final user = await repository.signIn(code, email, hash);
      AppModule.getProfileHolder().user = user;
      await AppModule.getPreferencesRepository().saveProfile(user.token!);
      emit(state.copyWith(apiStatus: LoadedStatus(item: user)));
    } catch (exception) {
      emit(state.copyWith(apiStatus: FailedStatus(exception.toString())));
      emit(state.copyWith(apiStatus: const IdleStatus()));
    }
  }

  Future<void> sendAuthCode() async {
    final repository = AppModule.getAuthRepository();
    emit(state.copyWith(apiStatus: LoadingStatus()));
    try {
      final response = await repository.sendAuthCode(state.email);
      emit(state.copyWith(apiStatus: LoadedStatus(data: response),email: state.email, hash: response['code']));
      print(state.hash);
      print(response);
    } catch (exception) {
      emit(state.copyWith(apiStatus: FailedStatus(exception.toString())));
      emit(state.copyWith(apiStatus: const IdleStatus()));
    }
  }

  Future<void> signInByToken() async {
    final repository = AppModule.getAuthRepository();
    emit(state.copyWith(apiStatus: LoadingStatus()));
    try {
      final user = await repository.signInByToken(state.token);
      AppModule.getProfileHolder().user = user;
      await AppModule.getPreferencesRepository().saveProfile(user.token!);
      emit(state.copyWith(apiStatus: LoadedStatus(item: user)));
    } catch (exception) {
      emit(state.copyWith(apiStatus: FailedStatus(exception.toString())));
      emit(state.copyWith(apiStatus: const IdleStatus()));
    }
  }

  Future<void> signUp(
      {required String email,
      required String surname,
      required String name,
      String? patronymic,
      required String username}) async {
    final repository = AppModule.getAuthRepository();
    emit(state.copyWith(apiStatus: LoadingStatus()));
    try {
      final Map<String, dynamic> response = await repository.signUp(
        email: email,
        surname: surname,
        username: username,
        name: name,
        patronymic: patronymic,
      );
      emit(state.copyWith(apiStatus: LoadedStatus(data: response)));
    } catch (exception) {
      emit(state.copyWith(apiStatus: FailedStatus(exception.toString())));
      emit(state.copyWith(apiStatus: const IdleStatus()));
    }
  }

  Future<void> emailChanged(String value) async {
    emit(state.copyWith(email: value));
  }

  Future<void> usernameChanged(String value) async {
    emit(state.copyWith(username: value));
  }

  Future<void> fioChanged({required String surname,required  String name, required String patronymic}) async {
    emit(state.copyWith(surname: surname, name: name, patronymic: patronymic));
  }

}
