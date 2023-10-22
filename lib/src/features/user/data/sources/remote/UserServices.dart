import 'dart:convert';
import 'package:hello_flutter/core/data/sources/network/BaseApi.dart';
import 'package:hello_flutter/src/features/user/data/mappers/UserMapper.dart';
import 'package:hello_flutter/src/features/user/domain/models/User.dart';
import 'package:http/http.dart' as http;

class UserService {
  getUsers() async {
    final url = Uri.parse('$BASE_API/users');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final usersJson = jsonDecode(response.body) as List;
      final users = usersJson.map((user) => UserMapper.fromMap(user)).toList();
      return users;
    } else {
      return [] as List<User>;
    }
  }

  getUser(String id) async {
    final url = Uri.parse('$BASE_API/users/$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final userJson = jsonDecode(response.body);
      final user = UserMapper.fromMap(userJson);
      return user;
    } else {
      return null;
    }
  }
}
