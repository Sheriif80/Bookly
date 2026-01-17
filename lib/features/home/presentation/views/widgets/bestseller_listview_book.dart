import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/assets_data.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class BestsellerListviewBook extends StatelessWidget {
  const BestsellerListviewBook({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.bookDetailsView);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SizedBox(
          height: 110,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                AspectRatio(
                  aspectRatio: 0.66,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: .circular(10),
                      color: Colors.amber,
                      image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(AssetsData.testBook3),
                      ),
                    ),
                  ),
                ),
                const Gap(30),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        'Harry Potter and the Goblet of Fire',
                        style: Styles.bookTitle,
                      ),
                      Gap(5),
                      Text('J.K. Rowling', style: Styles.textSmall),
                      Gap(5),
                      BookRating(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
