import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/book.dart';
import '../../../data/models/review.dart';
import '../../di/app_module.dart';
import '../models_status.dart';

part 'review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  ReviewCubit() : super(ReviewState());

  Future deleteReview(Review review) async {
    final repository = AppModule.getReviewRepository();
    emit(state.copyWith(deleteStatus: LoadingStatus()));
    try {
      await repository.deleteReview(review.id);
      emit(state.copyWith(deleteStatus: LoadedStatus()));
    } catch (exception) {
      emit(state.copyWith(
          deleteStatus:
              FailedStatus(state.deleteStatus.message ?? exception.toString())));
    }
  }

  Future<List<Review>?> loadReviews({String? filter, dynamic value}) async {
    final repository = AppModule.getReviewRepository();
    emit(state.copyWith(reviews: LoadingStatus()));
    try {
      final reviews = await repository.getAllReviews(filter: filter, value: value);
      emit(state.copyWith(reviews: LoadedStatus(item: reviews)));
      return reviews;
    } catch (exception) {
      emit(state.copyWith(reviews: FailedStatus(exception.toString())));
      return null;
    }
  }

  Future<List<Review>?> loadUserReview() async {
    final repository = AppModule.getReviewRepository();
    emit(state.copyWith(reviews: LoadingStatus()));
    try {
      final reviews = await repository.getUsersReview(
        id: AppModule.getProfileHolder().user.id,
      );
      emit(state.copyWith(reviews: LoadedStatus(item: reviews)));
      return reviews;
    } catch (exception) {
      emit(state.copyWith(reviews: FailedStatus(exception.toString())));
      return null;
    }
  }

  Future<void> createReview({
    required String description,
    required Book book,
    required int rating,
  }) async {
    final repository = AppModule.getReviewRepository();
    emit(state.copyWith(createReviewStatus: LoadingStatus<Review>()));
    try {
      print(description);

      print('book.id: ${book.id}');
      print(rating);
      final review = await repository.addReview(
        user: AppModule.getProfileHolder().user,
        book: book,
        description: description,
        rating: rating,
      );
      print('created review (review_cubit 36): $review');
      emit(state.copyWith(createReviewStatus: LoadedStatus(item: review)));
      emit(state.copyWith(createReviewStatus: const IdleStatus()));
    } catch (exception) {
      emit(state.copyWith(
          createReviewStatus:
              FailedStatus(state.createReviewStatus.message ?? exception.toString())));
    }
  }
  Future<void> ratingChanged(int value) async {
    emit(state.copyWith(rating: value));
  }
}
