import 'package:hello_flutter/core/domain/usecases/BaseUseCase.dart';
import 'package:hello_flutter/core/utils/Typedefs.dart';
import 'package:hello_flutter/src/features/user/domain/models/User.dart';
import 'package:hello_flutter/src/features/user/domain/repositories/UserRepository.dart';

class GetUsersUseCase extends UsecaseWithoutParams<List<User>> {
  UserRepository repository;

  GetUsersUseCase({required this.repository});
  
  @override
  ResultFuture<List<User>> execute() {
   return repository.getUsers();
  }

}
