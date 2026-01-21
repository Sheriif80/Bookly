import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key, required this.imageURL});

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: AspectRatio(
        aspectRatio: 0.66,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: .circular(16),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(imageURL),
            ),
          ),
        ),
      ),
    );
  }
}
