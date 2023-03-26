import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/review.dart';
import '../../../data/models/user.dart';
import '../../di/app_module.dart';
import '../models_status.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState());

  Future<void> loadProfile({User? user}) async {
    final repository = AppModule.getProfileRepository();
    //final reviewRepo = AppModule.getReviewRepository();
    emit(state.copyWith(status: LoadingStatus()));
    try {
      final loadedUser = await repository.getProfile(user: user);
      //final userReviews = await reviewRepo.getUsersReview(
        //  id: loadedUser.id, isArchive: isArchived);
      emit(state.copyWith(
          status: LoadedStatus(item: loadedUser)));
          //userReviews: LoadedStatus(userReviews)));
    } catch (exception) {
      emit(state.copyWith(status: FailedStatus(exception.toString())));
    }
  }
}
