part of 'review_cubit.dart';

class ReviewState {
  final ApiStatus<List<Review>> reviews;
  final ApiStatus<Review> createReviewStatus;
  final ApiStatus<void> deleteStatus;
  final int rating;

  ReviewState({
    this.createReviewStatus = const IdleStatus(),
    this.reviews = const IdleStatus(),
    this.deleteStatus = const IdleStatus(),
    this.rating = 0,
  });

  ReviewState copyWith({
    ApiStatus<List<Review>>? reviews,
    ApiStatus<Review>? createReviewStatus,
    ApiStatus<void>? deleteStatus,
    int? rating,
  }) =>
      ReviewState(
        createReviewStatus: createReviewStatus ?? this.createReviewStatus,
        reviews: reviews ?? this.reviews,
        deleteStatus: deleteStatus ?? this.deleteStatus,
          rating: rating ?? this.rating,
      );
}
