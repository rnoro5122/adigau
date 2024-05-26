import 'package:flutter/material.dart';

class Thumbnail extends StatelessWidget {
  final String imgUrl;
  final bool isVideo;
  const Thumbnail({super.key, required this.imgUrl, required this.isVideo});

  @override
  Widget build(BuildContext context) {
    return isVideo
        ? Container(
            decoration: const BoxDecoration(color: Colors.white),
            height: 72,
            width: 70,
            child: Image.network(
              imgUrl,
              scale: 15,
              fit: BoxFit.cover,
            ),
          )
        : Image.network(
            imgUrl,
            scale: 15,
          );
  }
}
