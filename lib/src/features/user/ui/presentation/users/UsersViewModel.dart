import 'package:flutter/material.dart';
import 'package:hello_flutter/core/ui/presentation/Status.dart';
import 'package:hello_flutter/src/features/user/domain/models/User.dart';
import 'package:hello_flutter/src/features/user/domain/usercases/GetUsersUseCase.dart';
import 'package:hello_flutter/src/features/user/ui/presentation/users/UsersState.dart';

class UsersViewModel {
  final GetUsersUseCase _getUsersUseCase;

  ValueNotifier<UsersState> state = ValueNotifier(const InitialState());

  UsersViewModel({required GetUsersUseCase getUsersUseCase})
      : _getUsersUseCase = getUsersUseCase;

  getUsers() async {
    _showLoading();
    final result = await _getUsersUseCase.execute();
     result.fold(
      (failure) => _isError(),
      (users) => _updateUsers(users)
    ); 
  }

  _showLoading() {
    state.value = const StatusState(status: Status.loading);
    //state.value = UsersState(status: Status.loading, users: state.value.users);
  }

  _updateUsers(List<User> users) {
    state.value = UserListState(users: users);
    //state.value = UsersState(status: Status.success, users: users);
  }

  _isError() {
        state.value = const StatusState(status: Status.error);

    //state.value = UsersState(status: Status.error, users: []);
  }

}
