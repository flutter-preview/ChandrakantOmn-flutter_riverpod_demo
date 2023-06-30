
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      var userinfo = await _userClient.fetchUserInfo(userId);
      sleep(const Duration(seconds: 3));
      state = state.copyWith(user: userinfo, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: 'Error fetching user info, id:$userId', user: null, isLoading: false);
    }
  }
}