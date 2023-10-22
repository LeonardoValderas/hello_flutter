import 'package:hello_flutter/core/utils/Typedefs.dart';
import 'package:hello_flutter/src/features/user/domain/models/User.dart';

abstract class UserRepository {
  ResultFuture<List<User>> getUsers();
  ResultFuture<User> getUser(String id);
}
