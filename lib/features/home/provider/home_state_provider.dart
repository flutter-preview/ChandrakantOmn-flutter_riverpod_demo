import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/features/home/data/models/joke_state.dart';
import 'package:flutter_riverpod_demo/features/home/data/repository/home_repository.dart';

import '../data/models/joke_state.dart';

class JokeDataNotifier extends StateNotifier<JokeState> {
  JokeDataNotifier(this.homeRepository) : super(JokeState()) {
    getJoke(0);
  }
  HomeRepository homeRepository;

  Future<void> getJoke([int count = 0]) async {
    state = state.copyWith(isLoading: true);
    await homeRepository.fetchJoke(count).then((data) {
      state = state.copyWith(joke: data, isLoading: false);
    });
  }
}
