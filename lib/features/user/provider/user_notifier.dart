
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/model/User.dart';
import '../data/model/state/user_state.dart';
import '../user_client.dart';
import 'dart:async';

class UserNotifier extends StateNotifier<UserState> {
  final UserClient _userClient;
  UserNotifier(this._userClient) : super(UserState()){
    //getUserInfo("1");
  }
  Future<void> getUserInfo(String userId) async {
    try {
      state = state.copyWith(isLoading: true);
      sleep(const Duration(seconds: 3));
      state = state.copyWith(user: User(DateTime.now().millisecondsSinceEpoch ~/ 1000, name: "Chandrakant", mobileNumber: "8600585624"), isLoading: false);
    } catch (e) {
      state = state.copyWith(error: 'Error fetching user info, id:$userId', user: null, isLoading: false);
    }
  }
}