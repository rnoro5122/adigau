import 'package:flutter/material.dart';

class Catagory extends StatelessWidget {
  const Catagory({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Column(
        children: [
          Container(
            width: 80,
            height: 50,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              'assets/images/cafe.jpeg',
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text('카페')
        ],
      ),
      onPressed: () {},
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return const Rect.fromLTWH(50, 13, 50, 50);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
