import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/features/user/data/model/state/user_state.dart';
import 'package:flutter_riverpod_demo/features/user/provider/user_notifier.dart';

import '../user_client.dart';

final userClientProvider = Provider<UserClient>((ref) => UserClient());


final userNotifierProvider = StateNotifierProvider<UserNotifier, UserState>(
      (ref) => UserNotifier(ref.watch(userClientProvider)),
);