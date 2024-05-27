import 'package:adigau/models/information_model.dart';
import 'package:adigau/services/api_service.dart';
import 'package:adigau/widgets/catagory_widget.dart';
import 'package:adigau/widgets/thumbnail_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final Future<List<InformationModel>> informations =
      ApiService.getInformations();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              alignment: Alignment.bottomLeft,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 40),
                child: Text(
                  '어디가유',
                  style: TextStyle(
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
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).canvasColor,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Catagory(
                        name: '카페',
                        imgPath: 'assets/images/cafe.jpeg',
                      ),
                      Catagory(
                        name: '맛집',
                        imgPath: 'assets/images/food.jpeg',
                      ),
                      Catagory(
                        name: '데이트',
                        imgPath: 'assets/images/couple.jpeg',
                      ),
                      Catagory(
                        name: '드라이브',
                        imgPath: 'assets/images/drive.png',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Container(
                      height: 3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  FutureBuilder(
                    future: informations,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Expanded(
                          child: ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 10,
                            ),
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              var information = snapshot.data![index];
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Theme.of(context).cardColor),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    children: [
                                      Thumbnail(
                                          imgUrl: information.imgUrl,
                                          isVideo: information.isVideo),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              information.name,
                                              style: const TextStyle(
                                                  fontFamily: "GmarketSansBold",
                                                  fontSize: 15),
                                            ),
                                            Text(
                                              information.location.substring(
                                                0,
                                                information.location
                                                        .indexOf('로') +
                                                    1,
                                              ),
                                              style:
                                                  const TextStyle(fontSize: 8),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: 80,
                                                  child: Text(
                                                    information.tags
                                                        .join(" ")
                                                        .split(' ')
                                                        .sublist(0, 3)
                                                        .join(''),
                                                    style: TextStyle(
                                                        fontSize: 8,
                                                        color: Colors.black
                                                            .withOpacity(0.7)),
                                                    softWrap: true,
                                                  ),
                                                ),
                                                SizedBox(
                                                  child: Row(
                                                    children: [
                                                      const Icon(
                                                          Icons.favorite),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        {
                                                          information.like *
                                                              1000000
                                                        }.toString().substring(
                                                              1,
                                                              {
                                                                information
                                                                        .like *
                                                                    1000000
                                                              }
                                                                  .toString()
                                                                  .indexOf('.'),
                                                            ),
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
                              );
                            },
                          ),
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
