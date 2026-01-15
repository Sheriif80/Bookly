import 'package:bookly/core/utils/assets_data.dart';
import 'package:flutter/material.dart';

class BooksListviewItem extends StatelessWidget {
  const BooksListviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: AspectRatio(
        aspectRatio: 0.66,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: .circular(16),
            color: Colors.amber,
            image: const DecorationImage(
              image: AssetImage(AssetsData.testBook),
            ),
          ),
        ),
      ),
    );
  }
}
