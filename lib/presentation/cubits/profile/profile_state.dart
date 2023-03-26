part of 'profile_cubit.dart';

class ProfileState {
  final ApiStatus<User> status;
  final ApiStatus<List<Review>> userReviews;

  ProfileState({
    this.status = const IdleStatus(),
    this.userReviews = const IdleStatus(),
  });

  ProfileState copyWith({
    ApiStatus<User>? status,
    ApiStatus<List<Review>>? userReviews,
  }) =>
      ProfileState(
        status: status ?? this.status,
        userReviews: userReviews ?? this.userReviews,
      );
}