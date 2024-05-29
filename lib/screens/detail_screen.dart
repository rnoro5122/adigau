import 'package:adigau/models/information_model.dart';
import 'package:adigau/services/api_service.dart';
import 'package:adigau/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class DetailScreen extends StatefulWidget {
  final String name, category, titleCategory;

  const DetailScreen({
    super.key,
    required this.name,
    required this.titleCategory,
    required this.category,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<InformationModel> information;

  @override
  void initState() {
    super.initState();
    information =
        ApiService.getInformationsByName(widget.category, widget.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
                child: Text(
                  '${widget.titleCategory}가유',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 50,
                    fontFamily: 'GmarketSansBold',
                    // fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 7,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).canvasColor,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60, vertical: 20),
                    child: GestureDetector(
                      onVerticalDragDown: (details) {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: FutureBuilder(
                      future: information,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return CardTitle(
                            name: snapshot.data!.name,
                            category: snapshot.data!.category,
                            titleCategory: widget.titleCategory,
                            imgUrl: snapshot.data!.imgUrl,
                            location: snapshot.data!.location,
                            isVideo: snapshot.data!.isVideo,
                            likes: snapshot.data!.likes,
                            tags: snapshot.data!.tags,
                          );
                        }
                        return const Text('...');
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 20,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(20),
                              bottom: Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 300,
                              width: 400,
                              child: NaverMap(
                                options: const NaverMapViewOptions(),
                                onMapReady: (controller) {
                                  print("네이버 맵 로딩됨!");
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text('설명'),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// ignore: camel_case_types
// class cardTitle extends StatelessWidget {
//   const cardTitle({
//     super.key,
//     required this.information,
//   });

//   final InformationModel information;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: Theme.of(context).cardColor),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Row(
//           children: [
//             Thumbnail(
//               name: information.name,
//               imgUrl: information.imgUrl,
//               isVideo: information.isVideo,
//             ),
//             const SizedBox(
//               width: 15,
//             ),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     information.name,
//                     style: const TextStyle(
//                         fontFamily: "GmarketSansBold", fontSize: 15),
//                   ),
//                   Text(
//                     information.location.split(" ").sublist(0, 3).join(" "),
//                     style: const TextStyle(fontSize: 8),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   Row(
//                     children: [
//                       SizedBox(
//                         width: 80,
//                         child: Text(
//                           information.tags
//                               .join(" ")
//                               .split(' ')
//                               .sublist(0, 3)
//                               .join(''),
//                           style: TextStyle(
//                               fontSize: 8,
//                               color: Colors.black.withOpacity(0.7)),
//                           softWrap: true,
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 50,
//                       ),
//                       SizedBox(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Icon(
//                               Icons.favorite_rounded,
//                               color: Colors.red.shade400,
//                             ),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                             Text(
//                               information.likes.toString(),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
