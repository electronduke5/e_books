import '../../data/models/book.dart';
import '../../data/models/review.dart';
import '../../data/models/user.dart';

abstract class ReviewRepository {
  Future<List<Review>> getUsersReview({required int id});

  Future<List<Review>> getAllReviews({String? filter, dynamic value});

  Future<Review> addReview({
    required String description,
    required Book book,
    required int rating,
    required User user,
  });

  Future deleteReview(int id);
}
