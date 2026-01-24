import 'package:bookly/core/erorrs/failures.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImplemtantion extends SearchRepo {
  final ApiService apiService;

  SearchRepoImplemtantion({required this.apiService});
  @override
  Future<Either<Failures, List<BookModel>>> fetchSearchResults({
    required String query,
  }) async {
    try {
      final data = await apiService.get(
        endPoint: 'volumes?filter=free-ebooks&q=subject: $query',
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
