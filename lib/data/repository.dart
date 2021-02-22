import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rocket_guide/data/rockets_api.dart';
import 'package:rocket_guide/models/models/rocket.dart';

final repositoryProvider = Provider<Repo>((ref) => Repo());

class Repo {
  RocketsAPI _api = RocketsAPI();

  Future<List<Rocket>> _rocketsList() async {
    List data = await _api.getAll();
    if (data != null) {
      // print(data);
      return data.map((jsonRocket) => Rocket.fromJson(jsonRocket)).toList();
    } else {
      throw Exception("SpaceX rockets' list API failed!");
    }
  }

  Future<Rocket> rocket(String id) async {
    var data = await _api.getRocket(id);
    if (data == 'not_found') {
      print('Rocket not found!');
      return Rocket(name: 'Missing!', id: id);
    } else if (data != null) {
      // print(data);
      return Rocket.fromJson(data);
    } else {
      throw Exception("SpaceX rocket's :id API failed!");
    }
  }

  Future<List<Rocket>> get rocketsList => _rocketsList();
}
