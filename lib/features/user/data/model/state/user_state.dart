

import 'package:freezed_annotation/freezed_annotation.dart';
import '../User.dart';
part 'user_state.freezed.dart';
@freezed
class UserState with _$UserState {
  factory UserState({
    @Default(null) User? user,
    @Default(false) bool isLoading,
    @Default(true) bool isIdeal,
    @Default(null) String? error,
  }) = _UserState;
}
