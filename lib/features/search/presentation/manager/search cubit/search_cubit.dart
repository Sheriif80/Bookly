import 'package:bloc/bloc.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

  final SearchRepo searchRepo;

  Future<void> getSearchResults(String query) async {
    emit(SearchLoading());

    final result = await searchRepo.fetchSearchResults(query: query);

    result.fold(
      (fail) {
        emit(SearchFailure(errorMessage: fail.errorMessage));
      },
      (result) {
        emit(SearchSuccess(books: result));
      },
    );
  }
}
