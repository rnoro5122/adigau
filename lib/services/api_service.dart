import 'dart:convert';
import 'package:adigau/models/information_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://127.0.0.1:8000';
  static const String items = 'items';

  static Future<List<InformationModel>> getInformations() async {
    List<InformationModel> informationInstance = [];
    final url = Uri.parse('$baseUrl/$items');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> informations = jsonDecode(
        utf8.decode(response.bodyBytes),
      );
      for (var information in informations) {
        informationInstance.add(
          InformationModel.fromJson(information),
        );
      }
    }
    return informationInstance;
  }
}
