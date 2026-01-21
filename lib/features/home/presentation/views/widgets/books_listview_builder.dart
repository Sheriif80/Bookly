import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/features/home/presentation/manager/featured%20books%20cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksListviewBuilder extends StatelessWidget {
  const BooksListviewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSucess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,

            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: .horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return BookItem(
                  imageURL: state.books[index].volumeInfo.imageLinks.thumbnail,
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
