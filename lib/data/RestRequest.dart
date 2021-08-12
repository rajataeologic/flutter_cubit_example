import 'package:flutter_cubit_example/models/PlayerDataModel.dart';

import 'network/RestClient.dart';

class RestRequest {
  RestClient _playerApiProvider = RestClient();

  Future<List<Players>?> fetchPlayersByCountry(String ?countryId) =>
      _playerApiProvider.fetchPlayersByCountry(countryId);

  Future<List<Players>?> fetchPlayersByName(String name) =>
      _playerApiProvider.fetchPlayersByName(name);
}
