import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/bestseller_listview_book.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_listview_builder.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: .start,
      children: [
        CustomAppBar(),
        BooksListviewBuilder(),
        Gap(52),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('Best Seller', style: Styles.headerMedium),
        ),
        Gap(20),
        BestsellerListviewBook(),
      ],
    );
  }
}
