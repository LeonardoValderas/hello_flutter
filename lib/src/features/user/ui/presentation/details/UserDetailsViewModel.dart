import 'package:flutter/material.dart';
import 'package:hello_flutter/core/ui/presentation/Status.dart';
import 'package:hello_flutter/src/features/user/domain/models/User.dart';
import 'package:hello_flutter/src/features/user/domain/usercases/GetUserUseCase.dart';
import 'package:hello_flutter/src/features/user/ui/presentation/details/UserDetailsState.dart';

class UserDetailsViewModel {
  final GetUserUseCase _getUserUseCase;

  ValueNotifier<UserDetailsState> state = ValueNotifier(const InitialState());

  UserDetailsViewModel({required GetUserUseCase getUserUseCase})
      : _getUserUseCase = getUserUseCase;

  getUser(String id) async {
    _showLoading();
    final result = await _getUserUseCase.execute(id);
    result.fold((failure) => _isError(),
        (user) => {if (user == null) _isError() else _updateUser(user)});
  }

  _showLoading() {
    state.value = const StatusState(status: Status.loading);
  }

  _updateUser(User user) {
    state.value = UserState(user: user);
  }

  _isError() {
    state.value = const StatusState(status: Status.error);
  }
}
