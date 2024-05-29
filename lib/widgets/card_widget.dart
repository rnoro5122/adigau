import 'package:adigau/screens/detail_screen.dart';
import 'package:adigau/widgets/thumbnail_widget.dart';
import 'package:flutter/material.dart';

class CardTitle extends StatelessWidget {
  final String name, category, titleCategory, imgUrl, location;
  final bool isVideo;
  final int likes;
  final List tags;

  const CardTitle({
    super.key,
    required this.name,
    required this.category,
    required this.titleCategory,
    required this.imgUrl,
    required this.location,
    required this.isVideo,
    required this.likes,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                DetailScreen(
                    name: name,
                    category: category,
                    titleCategory: titleCategory),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).cardColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Thumbnail(
                name: name,
                imgUrl: imgUrl,
                isVideo: isVideo,
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontFamily: "GmarketSansBold", fontSize: 15),
                    ),
                    Text(
                      location.split(" ").sublist(0, 3).join(" "),
                      style: const TextStyle(fontSize: 8),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 80,
                          child: Text(
                            tags.join(" ").split(' ').sublist(0, 3).join(''),
                            style: TextStyle(
                                fontSize: 8,
                                color: Colors.black.withOpacity(0.7)),
                            softWrap: true,
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.favorite_rounded,
                                color: Colors.red.shade400,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                likes.toString(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
