import 'package:equatable/equatable.dart';
import 'package:hello_flutter/core/ui/presentation/Status.dart';
import 'package:hello_flutter/src/features/user/domain/models/User.dart';

abstract class UserDetailsState extends Equatable {
  const UserDetailsState();

  @override
  List<Object> get props => [];
}

class InitialState extends UserDetailsState {
  const InitialState();
}

class StatusState extends UserDetailsState {
  const StatusState({required this.status});

  final Status status;

  @override
  List<Status> get props => [status];
}

class UserState extends UserDetailsState {
  const UserState({required this.user});

  final User user;

  @override
  List<User> get props => [user];
}
