import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/core/constants/app_theme.dart';

import '../data/model/User.dart';
import '../data/model/state/user_state.dart';
import '../provider/provider.dart';

class UserPage extends ConsumerWidget {
   UserPage({super.key});
   late int id= 0;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(userNotifierProvider);
    print(state);
     return Scaffold(appBar: AppBar(title: Text('title'.tr())), body: _buildBody(state));
  }

  Widget _buildBody(UserState state) {
    if (state.isLoading) {
      return const HomePageLoading();
    } else if (state.user != null) {
      return HomePageLoaded(user: state.user!);
    } else if (state.error != null) {
      return HomePageError(message: state.error ?? "");
    } else {
      return HomePageInitial();
    }
  }
}

class HomePageError extends StatelessWidget {
  final String message;
  final TextEditingController _userIdController = TextEditingController();

  HomePageError({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _userIdController,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              //context.read(userNotifierProvider).getUserInfo(_userIdController.text);
            },
            child: const Text('Get user info'),
          ),
          Text(
            message,
            style: const TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }
}

class HomePageInitial extends ConsumerWidget {

  HomePageInitial({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              print("Fetch dadta");
              ref.read(userNotifierProvider.notifier).getUserInfo("10");
            },
            child: const Text('Get user info'),
          ),
        ],
      ),
    );
  }
}

class HomePageLoaded extends ConsumerWidget {
  final User user;
  final TextEditingController _userIdController = TextEditingController();

  HomePageLoaded({super.key, required this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Image.network(""),
            StyledText('NAME: ${user.name}'),
            StyledText('ID: ${user.id}'),
            StyledText('mobile: ${user.mobileNumber}'),
            TextField(
              controller: _userIdController,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                print("Fetch dadta");
                ref.read(userNotifierProvider.notifier).getUserInfo("10");
              },
              child: const Text('Get user info'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePageLoading extends StatelessWidget {
  const HomePageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class StyledText extends StatelessWidget {
  final String text;

  StyledText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
