import 'package:bookly/core/utils/link_opener.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BookActions extends StatelessWidget {
  const BookActions({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38),
      child: Row(
        children: [
          const CustomButton(
            buttonColor: Colors.white,
            textColor: Colors.black,
            text: 'FREE',
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          ),
          CustomButton(
            onPressed: () async {
              Future.delayed(const Duration(seconds: 1), () async {
                await LinkOpener.openUrl(
                  context,
                  bookModel.volumeInfo.previewLink!,
                );
              });
            },
            buttonColor: const Color(0xffEF8262),
            textColor: Colors.white,
            text: 'Free Preview',
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
        ],
      ),
    );
  }
}
