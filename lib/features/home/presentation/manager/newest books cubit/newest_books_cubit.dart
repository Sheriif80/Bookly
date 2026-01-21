import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());

  final HomeRepo homeRepo;

  Future<void> getNewestBooks() async {
    emit(NewestBooksLoading());
    final result = await homeRepo.fetchNewestBooks();

    result.fold(
      (fail) {
        emit(NewestBooksFailure(fail.errorMessage));
      },
      (books) {
        emit(NewestBooksSucess(books: books));
      },
    );
  }
}
