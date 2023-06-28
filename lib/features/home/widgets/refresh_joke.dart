import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/features/home/provider/home_provider.dart';

class RefreshJoke extends ConsumerWidget {
  final int id;
  const RefreshJoke(
    this.id, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () {
        ref.read(jokeDataProvider.notifier).getJoke(id);
      },
      child: const Icon(Icons.refresh),
    );
  }
}
