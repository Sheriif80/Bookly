import 'package:bookly/core/erorrs/failures.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplementaion extends HomeRepo {
  final ApiService apiService;

  HomeRepoImplementaion({required this.apiService});
  @override
  Future<Either<Failures, List<BookModel>>> fetchNewestBooks() async {
    try {
      final data = await apiService.get(
        endPoint:
            'volumes?filter=free-ebooks&q=subject: mathematics&orderBy=newest',
      );
      final List<BookModel> books = [];

      for (final book in data['items']) {
        books.add(BookModel.fromJson(book));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      final data = await apiService.get(
        endPoint: 'volumes?filter=free-ebooks&q=subject: programming',
      );
      final List<BookModel> books = [];

      for (final book in data['items']) {
        books.add(BookModel.fromJson(book));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      final data = await apiService.get(
        endPoint:
            'volumes?filter=free-ebooks&orderBy=relevance&q=subject: $category',
      );
      final List<BookModel> books = [];

      for (final book in data['items']) {
        books.add(BookModel.fromJson(book));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
