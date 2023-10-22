import 'package:dartz/dartz.dart';
import 'package:hello_flutter/core/data/sources/network/errors/Exceptions.dart';
import 'package:hello_flutter/core/data/sources/network/errors/Failure.dart';
import 'package:hello_flutter/core/utils/Typedefs.dart';
import 'package:hello_flutter/src/features/user/data/sources/remote/UserServices.dart';
import 'package:hello_flutter/src/features/user/domain/models/User.dart';
import 'package:hello_flutter/src/features/user/domain/repositories/UserRepository.dart';

class UserRepositoryImpl implements UserRepository {
  UserService service;

  UserRepositoryImpl({required this.service});

  @override
  ResultFuture<List<User>> getUsers() async {
    try {
      final users = await service.getUsers();
      return Right(users);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<User> getUser(String id) async {
    try {
      final user = await service.getUser(id);
      return Right(user);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }
}
