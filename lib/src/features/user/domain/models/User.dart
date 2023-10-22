import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String name;
  final String createdAt;
  final String? avatar;

  const User({
    this.id,
    required this.name,
    required this.createdAt,
    this.avatar,
  });

  User copyWith(
      {final String? id,
      final String? name,
      final String? createdAt,
      final String? avatar}) {
    return User(
        id: id ?? this.id,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        avatar: avatar ?? this.avatar);
  }

  @override
  List<Object?> get props => [id];
}
