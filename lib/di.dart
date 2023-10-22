import 'package:get_it/get_it.dart';
import 'package:hello_flutter/src/features/user/data/repositories/UserRepositoryImpl.dart';
import 'package:hello_flutter/src/features/user/data/sources/remote/UserServices.dart';
import 'package:hello_flutter/src/features/user/domain/repositories/UserRepository.dart';
import 'package:hello_flutter/src/features/user/domain/usercases/GetUserUseCase.dart';
import 'package:hello_flutter/src/features/user/domain/usercases/GetUsersUseCase.dart';
import 'package:hello_flutter/src/features/user/ui/presentation/details/UserDetailsViewModel.dart';
import 'package:hello_flutter/src/features/user/ui/presentation/users/UsersViewModel.dart';

final getIt = GetIt.instance;

Future<void> initDI() async {
  await _userDI();
}

Future<void> _userDI() async {
  getIt
    ..registerLazySingleton(() => UserService())
    ..registerLazySingleton<UserRepository>(() => UserRepositoryImpl(service: getIt()))
    ..registerLazySingleton(() => GetUsersUseCase(repository: getIt()))
    ..registerLazySingleton(() => GetUserUseCase(repository: getIt()))
    ..registerLazySingleton(() => UsersViewModel(getUsersUseCase: getIt()))
    ..registerLazySingleton(() => UserDetailsViewModel(getUserUseCase: getIt()));
}