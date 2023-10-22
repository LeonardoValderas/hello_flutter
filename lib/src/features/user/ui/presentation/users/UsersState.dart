import 'package:equatable/equatable.dart';
import 'package:hello_flutter/core/ui/presentation/Status.dart';
import 'package:hello_flutter/src/features/user/domain/models/User.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

class InitialState extends UsersState {
  const InitialState();
}

class StatusState extends UsersState {
  const StatusState({required this.status});

  final Status status;

  @override
  List<Status> get props => [status];
}

class UserListState extends UsersState {
  const UserListState({required this.users});

  final List<User> users;

  @override
  List<List<User>> get props => [users];
}
