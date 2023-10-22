import 'package:hello_flutter/core/domain/usecases/BaseUseCase.dart';
import 'package:hello_flutter/core/utils/Typedefs.dart';
import 'package:hello_flutter/src/features/user/domain/models/User.dart';
import 'package:hello_flutter/src/features/user/domain/repositories/UserRepository.dart';

class GetUserUseCase extends UsecaseWithParams<User?, String> {
  UserRepository repository;

  GetUserUseCase({required this.repository});
  
  @override
  ResultFuture<User?> execute(String params) {
   return repository.getUser(params);
  }

}
