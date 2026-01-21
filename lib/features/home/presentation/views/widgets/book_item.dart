import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key, required this.imageURL});

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ClipRRect(
        borderRadius: .circular(16),
        child: AspectRatio(
          aspectRatio: 0.66,
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            errorWidget: (context, url, error) => const Icon(Icons.error),
            imageUrl: imageURL,
          ),
        ),
      ),
    );
  }
}
