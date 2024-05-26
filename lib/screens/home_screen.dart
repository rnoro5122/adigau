import 'package:adigau/models/information_model.dart';
import 'package:adigau/services/api_service.dart';
import 'package:adigau/widgets/catagory_widget.dart';
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
                      Catagory(),
                      Catagory(),
                      Catagory(),
                      Catagory(),
                    ], //TODO: 위젯 클래스 제대로 만들기
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
                                    horizontal: 10, vertical: 50),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Theme.of(context).cardColor),
                                child: Text(information.title),
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
