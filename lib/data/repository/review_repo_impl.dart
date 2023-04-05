import 'package:e_books/data/models/book.dart';
import 'package:e_books/data/models/user.dart';
import 'package:e_books/data/utils/constants.dart';

import '../../domain/repository/review_repository.dart';
import '../api_service.dart';
import '../models/review.dart';

class ReviewRepositoryImpl with ApiService<Review> implements ReviewRepository {
  @override
  String apiRoute = ApiConstUrl.reviewUrl;

  @override
  Future<Review> addReview(
      {required String description,
      required Book book,
      required int rating,
      required User user,}) {
    return post(
      fromJson: (Map<String, dynamic> json) => Review.fromJson(json),
      data: {
        'description': description,
        'book_id': book.id,
        'user_id': user.id,
        'rating': rating,
      },
    );
  }

  @override
  Future deleteReview(int id) {
    return delete(id);
  }

  @override
  Future<List<Review>> getAllReviews({String? filter, value}) {
    return getAll(
      fromJson: (Map<String, dynamic> json) => Review.fromJson(json),
      params: {filter ?? '': value},
    );
  }

  @override
  Future<List<Review>> getUsersReview({required int id}) {
    return getAll(
      fromJson: (Map<String, dynamic> json) => Review.fromJson(json),
      params: {'user': id},
    );
  }
}
