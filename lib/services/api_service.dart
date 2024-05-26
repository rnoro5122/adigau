import 'dart:convert';
import 'package:adigau/models/information_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      'https://webtoon-crawler.nomadcoders.workers.dev';
  static const String today = 'today';

  Future<List<InformationModel>> getInformation() async {
    final List<InformationModel> informationInstance = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> informations = jsonDecode(response.body);
      for (var information in informations) {
        informationInstance.add(
          InformationModel.fromJson(information),
        );
      }
    }
    return informationInstance;
  }
}
