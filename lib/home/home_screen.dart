import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rocket_guide/data/repository.dart';
import 'package:rocket_guide/home/rocket_box.dart';
import 'package:rocket_guide/models/models/rocket.dart';

final rocketsListProvider = FutureProvider<List<Rocket>>((ref) async {
  return await ref.watch(repositoryProvider).rocketsList;
});

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rocket Guide'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20),
        child: watch(rocketsListProvider).when(
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
          error: (e, s) => SnackBar(content: Text(e.toString())),
          data: (rockets) => ListView.separated(
            itemCount: rockets.length,
            separatorBuilder: (context, _index) => Divider(),
            itemBuilder: (context, _index) => RocketBox(
              key: Key(rockets[_index].id),
              rocket: rockets[_index],
            ),
          ),
        ),
      ),
    );
  }
}
