part of 'profile_cubit.dart';

class ProfileState {
  final ApiStatus<User> status;
  final ApiStatus<User> subscribeStatus;
  final ApiStatus<User> updateUserStatus;
  final ApiStatus<List<Review>> userReviews;

  ProfileState({
    this.status = const IdleStatus(),
    this.updateUserStatus = const IdleStatus(),
    this.subscribeStatus = const IdleStatus(),
    this.userReviews = const IdleStatus(),
  });

  ProfileState copyWith({
    ApiStatus<User>? status,
    ApiStatus<User>? updateUserStatus,
    ApiStatus<User>? subscribeStatus,
    ApiStatus<List<Review>>? userReviews,
  }) =>
      ProfileState(
        subscribeStatus: subscribeStatus ?? this.subscribeStatus,
        status: status ?? this.status,
        updateUserStatus: updateUserStatus ?? this.updateUserStatus,
        userReviews: userReviews ?? this.userReviews,
      );
}