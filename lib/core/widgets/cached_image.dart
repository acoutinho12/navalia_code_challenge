import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

final class CachedImage extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  const CachedImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
  });
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
