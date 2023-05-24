import 'package:bloc/bloc.dart';

import '../../../data/models/review.dart';
import '../../../data/models/user.dart';
import '../../di/app_module.dart';
import '../models_status.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState());

  Future<void> loadProfile(
      {User? user, bool isFromApi = false, bool updateHolder = false}) async {
    final repository = AppModule.getProfileRepository();
    //final reviewRepo = AppModule.getReviewRepository();
    emit(state.copyWith(status: LoadingStatus()));
    try {
      final loadedUser = await repository.getProfile(user: user, isFromApi: isFromApi);
      //final userReviews = await reviewRepo.getUsersReview(
      //  id: loadedUser.id, isArchive: isArchived);
      emit(state.copyWith(status: LoadedStatus(item: loadedUser)));
      if (updateHolder) {
        AppModule.getProfileHolder().user = loadedUser;
      }
      //userReviews: LoadedStatus(userReviews)));
    } catch (exception) {
      emit(state.copyWith(status: FailedStatus(exception.toString())));
    }
  }

  Future<User?> subscribe(User user) async {
    final repository = AppModule.getProfileRepository();
    emit(state.copyWith(subscribeStatus: LoadingStatus()));
    try {
      final loadedUser = await repository.subscribeUser(authorId: user.id, userId: AppModule.getProfileHolder().user.id);
      emit(state.copyWith(subscribeStatus: LoadedStatus(item: loadedUser)));
      return loadedUser;
    } catch (exception) {
      emit(state.copyWith(subscribeStatus: FailedStatus(exception.toString())));
      return null;
    }
  }

  Future<User?> updateProfile({required String surname, required String name, String? patronymic}) async {
    final repository = AppModule.getProfileRepository();
    emit(state.copyWith(status: LoadingStatus()));
    try {
      User loadedUser = await repository.updateProfile(surname: surname, name: name, patronymic: patronymic);
      emit(state.copyWith(status: LoadedStatus(item: loadedUser)));
      AppModule.getProfileHolder().user = loadedUser;
      return loadedUser;
    } catch (exception) {
      emit(state.copyWith(status: FailedStatus(exception.toString())));
      return null;
    }
  }
}
