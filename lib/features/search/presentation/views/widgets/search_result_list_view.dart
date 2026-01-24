import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/presentation/views/widgets/bestseller_listview_book.dart';
import 'package:bookly/features/search/presentation/manager/search%20cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SerachResultListView extends StatelessWidget {
  const SerachResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return ListView.builder(
            itemCount: state.books.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ), // Add spacing here
                child: BestsellerListviewBook(bookModel: state.books[index]),
              );
            },
          );
        } else if (state is SearchFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else if (state is SearchLoading) {
          return const CustomLoadingIndicator();
        } else {
          return const Column(
            children: [
              Gap(10),
              Center(
                child: Text(
                  'Type something to search.. 🧐',
                  style: Styles.textLarge,
                ),
              ),
            ],
          );
        }
      },
    );
  }
}

//////////////////////////////////
//  SliverList(
//       delegate: SliverChildBuilderDelegate((context, index) {
//         return const Padding(
//           padding: EdgeInsets.symmetric(vertical: 10), // Add spacing here
//           child: SizedBox(), // BestsellerListviewBook(),
//         );
//       }, childCount: 10),
//     );
