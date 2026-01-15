import 'package:bookly/core/utils/assets_data.dart';
import 'package:flutter/material.dart';

class BestsellerListviewBook extends StatelessWidget {
  const BestsellerListviewBook({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                    image: AssetImage(AssetsData.testBook2),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
