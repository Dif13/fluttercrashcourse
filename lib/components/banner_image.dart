import 'package:flutter/material.dart';

class BannerImage extends StatelessWidget {
  final String url;
  final double height;

  const BannerImage({super.key, required this.url, required this.height});

  @override
  Widget build(BuildContext context) {
    Image image;
    try {
      if (url.isNotEmpty) {
        image = Image.network(url, fit: BoxFit.cover);
        return Container(
          constraints: BoxConstraints.expand(height: height),
          child: image,
        );
      }
    } catch (e) {
      print("Could not load image $url");
    }
    return Container();
  }
}
