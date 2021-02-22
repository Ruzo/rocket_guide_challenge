import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rocket_guide/data/favorites.dart';
import 'package:rocket_guide/models/models/rocket.dart';
import 'package:url_launcher/url_launcher.dart';

final favsProvider = StateNotifierProvider<FavsStateNotifier>((ref) => FavsStateNotifier());

class RocketDetailsScreen extends ConsumerWidget {
  final Rocket rocket;

  const RocketDetailsScreen({@required this.rocket});

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final favorites = watch(favsProvider.state);
    final bool favored = favorites.contains(rocket.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(rocket.name),
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: favored ? Colors.red : Colors.grey[600],
            ),
            onPressed: () => favored
                ? context.read(favsProvider).remove(rocketID: rocket.id)
                : context.read(favsProvider).add(rocketID: rocket.id),
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 300,
            child: PageView(
              children: rocket.flickrImages.map((img) => Image.network(img)).toList(),
            ),
          ),
          ListTile(
            leading: Icon(
              rocket.active ? Icons.airplanemode_active : Icons.airplanemode_inactive,
              size: 40,
              color: Colors.grey,
            ),
            title: Text(rocket.active ? 'Currently active' : 'Currently inactive'),
          ),
          ListTile(
            leading: Icon(
              Icons.description,
              size: 40,
              color: Colors.grey,
            ),
            title: Text(rocket.description),
          ),
          // Padding(padding: EdgeInsets.all(20)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: TextButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(1.0),
              ),
              child: Center(
                child: Text(
                  'Open Wikipedia Article',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              onPressed: () => launch(rocket.wikipedia),
            ),
          )
        ],
      ),
    );
  }
}
