import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class BestsellerListviewBook extends StatelessWidget {
  const BestsellerListviewBook({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.bookDetailsView, extra: bookModel);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SizedBox(
          height: 110,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: .circular(10),
                  child: AspectRatio(
                    aspectRatio: 0.66,
                    child: CachedNetworkImage(
                      fit: .fill,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      imageUrl: bookModel.volumeInfo.imageLinks.thumbnail,
                    ),
                  ),
                ),
                const Gap(30),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        bookModel.volumeInfo.title!,
                        style: Styles.bookTitle,
                      ),
                      const Gap(5),
                      Text(
                        bookModel.volumeInfo.authors?.isNotEmpty == true
                            ? bookModel.volumeInfo.authors![0]
                            : 'Unknown Author',
                        style: Styles.textSmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Gap(5),
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              'FREE',
                              style: Styles.textSmall.copyWith(
                                fontWeight: .bold,
                              ),
                            ),
                            const Spacer(),
                            BookRating(count: bookModel.volumeInfo.pageCount!),
                          ],
                        ),
                      ),
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
