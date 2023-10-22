import 'package:dartz/dartz.dart';
import 'package:hello_flutter/core/data/sources/network/errors/Failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef DataMap = Map<String, dynamic>;