import 'package:adigau/models/information_model.dart';
import 'package:adigau/services/api_service.dart';
import 'package:adigau/widgets/catagory_widget.dart';
import 'package:adigau/widgets/thumbnail_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final Future<List<InformationModel>> informations =
      ApiService().getInformation();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
                child: Text(
                  '어디가유',
                  style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
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
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black38,
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
                            padding: const EdgeInsets.symmetric(horizontal: 30),
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
                                    horizontal: 10, vertical: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Theme.of(context).cardColor),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Thumbnail(
                                          imgUrl:
                                              'http://scontent.cdninstagram.com/v/t51.29350-15/434078755_447616284284996_8756238472872437548_n.jpg?stp=dst-jpg_e15&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xMDgweDE5MjAuc2RyLmYyOTM1MCJ9&_nc_ht=scontent.cdninstagram.com&_nc_cat=108&_nc_ohc=cK-BmwTeiCoQ7kNvgEWP-vL&edm=APs17CUBAAAA&ccb=7-5&ig_cache_key=MzMyODUxNDYyMDc3ODE0MTQ5NQ%3D%3D.2-ccb7-5&oh=00_AYB9GV-v8lQlRbbc7U-lnG7EG5m-GzaJ08lv-nxHIfhRMg&oe=6656FE4C&_nc_sid=10d13b',
                                          isVideo: true),
                                      Text(information.title),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return const Text('umm');
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
