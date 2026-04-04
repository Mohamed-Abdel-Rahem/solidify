import 'package:clean_arch/core/errors/failure.dart';
import 'package:clean_arch/features/users/domain/entities/user_entity.dart';
import 'package:clean_arch/features/users/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class GetUser {
  final UserRepository userRepository;

  GetUser({required this.userRepository});
  Future<Either<Failure, UserEntity>> call() {
    return userRepository.getUser();
  }
}
