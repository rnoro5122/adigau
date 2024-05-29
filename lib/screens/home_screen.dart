import 'package:adigau/models/information_model.dart';
import 'package:adigau/services/api_service.dart';
import 'package:adigau/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<InformationModel>> informations;
  late String category;
  late String titleCategory;

  @override
  void initState() {
    super.initState();
    category = "cafes";
    informations = ApiService.getInformationsByCategory(category);
    titleCategory = '어디';
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
                  '$titleCategory가유',
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              titleCategory = '카페';
                              category = "cafes";
                              informations =
                                  ApiService.getInformationsByCategory(
                                      category);
                            });
                          },
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
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              titleCategory = '맛집';
                              category = "restaurants";
                              informations =
                                  ApiService.getInformationsByCategory(
                                      category);
                            });
                          },
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
                                  'assets/images/food.jpeg',
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text('맛집')
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              titleCategory = '술집';
                              category = "pubs";
                              informations =
                                  ApiService.getInformationsByCategory(
                                      category);
                            });
                          },
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
                              const Text('술집')
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              titleCategory = '어디';
                            });
                          },
                          icon: Column(
                            children: [
                              SizedBox(
                                width: 80,
                                height: 50,
                                child: Icon(
                                  Icons.favorite_rounded,
                                  size: 55,
                                  color: Colors.red.shade400,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text('찜')
                            ],
                          ),
                        ),
                      ],
                    ),
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
                  FutureBuilder(
                    future: informations,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Expanded(
                          child: RefreshIndicator(
                            onRefresh: () async {
                              setState(() {
                                informations =
                                    ApiService.getInformationsByCategory(
                                        category);
                              });
                            },
                            child: ListView.separated(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                height: 10,
                              ),
                              scrollDirection: Axis.vertical,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                var information = snapshot.data![index];
                                return CardTitle(
                                  name: information.name,
                                  category: information.category,
                                  titleCategory: titleCategory,
                                  imgUrl: information.imgUrl,
                                  location: information.location,
                                  isVideo: information.isVideo,
                                  likes: information.likes,
                                  tags: information.tags,
                                );
                              },
                            ),
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

// ignore: camel_case