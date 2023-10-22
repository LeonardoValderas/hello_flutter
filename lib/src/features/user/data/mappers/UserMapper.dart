import 'dart:convert';
import 'package:hello_flutter/src/features/user/domain/models/User.dart';

class UserMapper {
  static String toJson(User user) => json.encode(toMap(user));

  static User fromJson(String source) => fromMap(json.decode(source));

  static Map<String, dynamic> toMap(User user) {
    return {
      'name': user.name,
      'createdAt': user.createdAt,
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      createdAt: map['createdAt'] ?? '',
      avatar: map['avatar'] ?? 'https://cdn1.iconfinder.com/data/icons/user-pictures/100/male3-64.png',
    );
  }
}