import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_item.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_actions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.27),
          child: BookItem(imageURL: bookModel.volumeInfo.imageLinks.thumbnail),
        ),
        const Gap(45),
        Text(
          bookModel.volumeInfo.title!,
          style: Styles.bookTitleLarge,
          textAlign: .center,
        ),
        const Gap(9),
        Opacity(
          opacity: 0.9,
          child: Text(
            bookModel.volumeInfo.authors?.isNotEmpty == true
                ? bookModel.volumeInfo.authors![0]
                : 'Unknown Author',
            style: Styles.textMedium.copyWith(
              color: Colors.grey.shade300,
              fontStyle: .italic,
            ),
          ),
        ),
        const Gap(18),
        Row(
          mainAxisAlignment: .center,
          children: [BookRating(count: bookModel.volumeInfo.pageCount!)],
        ),
        const Gap(38),
        BookActions(bookModel: bookModel),
      ],
    );
  }
}
