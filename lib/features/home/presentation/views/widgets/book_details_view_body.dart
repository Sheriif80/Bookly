import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_item.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_actions.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: SafeArea(
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.27),
                  child: const BookItem(),
                ),
                const Gap(45),
                const Text('The Jungle Book', style: Styles.bookTitleLarge),
                const Gap(9),
                Opacity(
                  opacity: 0.9,
                  child: Text(
                    'Rudyard Kipling',
                    style: Styles.textMedium.copyWith(
                      color: Colors.grey.shade300,
                      fontStyle: .italic,
                    ),
                  ),
                ),
                const Gap(18),
                const Row(mainAxisAlignment: .center, children: [BookRating()]),
                const Gap(38),
                const BookActions(),
                const Expanded(child: Gap(51)),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Align(
                    alignment: .centerLeft,
                    child: Text(
                      'You can also like',
                      style: Styles.textMedium.copyWith(fontWeight: .bold),
                    ),
                  ),
                ),
                const Gap(17),

                const SimilarBookListView(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
