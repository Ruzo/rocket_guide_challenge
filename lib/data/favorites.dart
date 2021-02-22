import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavsStateNotifier extends StateNotifier<List<String>> {
  FavsStateNotifier() : super([]);

  void add({String rocketID}) {
    state = [...state, rocketID];
  }

  void remove({String rocketID}) {
    List<String> prevState = [...state];
    prevState.remove(rocketID);

    state = [...prevState];
  }
}
