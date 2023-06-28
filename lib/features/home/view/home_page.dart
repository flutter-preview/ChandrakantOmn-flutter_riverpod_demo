import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/features/home/provider/home_provider.dart';
import 'package:flutter_riverpod_demo/features/home/widgets/joke_view.dart';
import 'package:flutter_riverpod_demo/features/home/widgets/refresh_joke.dart';
import 'package:flutter_riverpod_demo/features/user/view/user_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(jokeDataProvider).isLoading;
    final joke = ref.watch(jokeDataProvider).joke;
    return Scaffold(
      appBar: AppBar(title: Text('title'.tr())),
      floatingActionButton: const RefreshJoke(9),
      body: isLoading
          ? const HomePageLoading()
          : JokeView(joke: joke),
    );
  }
}
