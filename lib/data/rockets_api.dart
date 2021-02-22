import 'dart:convert';

import 'package:http/http.dart' as http;

class RocketsAPI {
  final String _url = 'api.spacexdata.com';

  RocketsAPI();

  Future<List> getAll() async {
    print('getAll() running');
    var response = await http.get(Uri.https(_url, '/v4/rockets'));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      // print(data);
      return data;
    } else {
      print('SpaceX API failed!');
      return null;
    }
  }

  Future getRocket(String id) async {
    print('getRocket() running with id: $id');
    var response = await http.get(Uri.https(_url, '/v4/rockets/$id'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      // print(data);
      return data;
    } else if (response.statusCode == 404) {
      print('Rocket not found!');
      return 'not_found';
    } else {
      print('SpaceX API failed!');
      return null;
    }
  }
}
