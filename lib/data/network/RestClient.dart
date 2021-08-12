import 'dart:convert';

import 'package:flutter_cubit_example/models/PlayerDataModel.dart';
import 'package:http/http.dart' as http;

class RestClient {
  String baseUrl = "https://www.easports.com/fifa/ultimate-team/api/fut/item?";
  final successCode = 200;

  Future<List<Players>> fetchPlayersByCountry(String? countryId) async {
    final response = await http.get(Uri.https("www.easports.com", "/fifa/ultimate-team/api/fut/item",{"country":countryId}));
    print(response.body);
    print("${baseUrl + "country=" + countryId!}");
    return parseResponse(response);
  }

  Future<List<Players>?> fetchPlayersByName(String name) async {
    final response = await http.get(Uri(scheme: baseUrl + "name=" + name));

    return parseResponse(response);
  }

  List<Players> parseResponse(http.Response response) {
    final responseString = jsonDecode(response.body);
    print("BODY: ${response.body}");
    if (response.statusCode == successCode) {
      List<Players>  list=ApiResult.fromJson(responseString).items!;
      return list;
    } else {
      throw Exception('failed to load players');
    }
  }
}
