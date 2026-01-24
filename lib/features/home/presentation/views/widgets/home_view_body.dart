import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/manager/featured%20books%20cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/manager/newest%20books%20cubit/newest_books_cubit.dart';
import 'package:bookly/features/home/presentation/manager/similar%20books%20cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/bestseller_listview_builder.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_listview_builder.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<NewestBooksCubit>(context).getNewestBooks();
          BlocProvider.of<FeaturedBooksCubit>(context).getFeaturedBooks();
        },
        child: const Column(
          crossAxisAlignment: .start,
          children: [
            CustomAppBar(),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: BooksListviewBuilder()),
                  SliverToBoxAdapter(child: Gap(52)),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Latest Books 📚',
                        style: Styles.headerMedium,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: Gap(20)),
                  SliverToBoxAdapter(child: BestsellerListviewBuilder()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
