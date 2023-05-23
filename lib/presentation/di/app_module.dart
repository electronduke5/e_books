import 'package:e_books/domain/repository/review_repository.dart';
import 'package:e_books/domain/repository/shelf_repository.dart';
import 'package:e_books/presentation/di/profile_holder.dart';
import 'package:get_it/get_it.dart';

import '../../data/repository/auth_repo_impl.dart';
import '../../data/repository/book_repository_impl.dart';
import '../../data/repository/post_repo_impl.dart';
import '../../data/repository/preferences_repo_impl.dart';
import '../../data/repository/profile_repo_impl.dart';
import '../../data/repository/review_repo_impl.dart';
import '../../data/repository/shelf_repo_impl.dart';
import '../../domain/repository/auth_repository.dart';
import '../../domain/repository/book_repository.dart';
import '../../domain/repository/post_repository.dart';
import '../../domain/repository/preferences_repository.dart';
import '../../domain/repository/profile_repository.dart';

class AppModule {
  static bool _provided = false;

  void provideDependencies() {
    if (_provided) return;
    _provideProfileHolder();
    _providePreferencesRepository();
    _provideAuthRepository();
    _provideProfileRepository();
    _provideBookRepository();
    _provideShelfRepository();
    _provideReviewRepository();
    _providePostRepository();

    _provided = true;
  }

  void _provideProfileHolder() {
    GetIt.instance.registerSingleton(ProfileHolder());
  }

  static ProfileHolder getProfileHolder() {
    return GetIt.instance.get<ProfileHolder>();
  }

  void _provideProfileRepository() {
    GetIt.instance.registerSingleton(ProfileRepositoryImpl());
  }

  static ProfileRepository getProfileRepository() {
    return GetIt.instance.get<ProfileRepositoryImpl>();
  }

  void _provideAuthRepository() {
    GetIt.instance.registerSingleton(AuthRepositoryImpl());
  }

  static AuthRepository getAuthRepository() {
    return GetIt.instance.get<AuthRepositoryImpl>();
  }

  void _provideReviewRepository() {
    GetIt.instance.registerSingleton(ReviewRepositoryImpl());
  }

  static ReviewRepository getReviewRepository() {
    return GetIt.instance.get<ReviewRepositoryImpl>();
  }

  void _provideBookRepository() {
    GetIt.instance.registerSingleton(BookRepositoryImpl());
  }

  static BookRepository getBookRepository() {
    return GetIt.instance.get<BookRepositoryImpl>();
  }

  void _provideShelfRepository() {
    GetIt.instance.registerSingleton(ShelfRepositoryImpl());
  }

  static ShelfRepository getShelfRepository() {
    return GetIt.instance.get<ShelfRepositoryImpl>();
  }

  void _providePostRepository() {
    GetIt.instance.registerSingleton(PostRepositoryImpl());
  }

  static PostRepository getPostRepository() {
    return GetIt.instance.get<PostRepositoryImpl>();
  }

  void _providePreferencesRepository() {
    GetIt.instance.registerSingleton(PreferencesRepositoryImpl());
  }

  static PreferencesRepository getPreferencesRepository() {
    if (!_provided) throw Exception("Value not provided");
    return GetIt.instance.get<PreferencesRepositoryImpl>();
  }
}
