import 'package:dartz/dartz.dart';
import 'package:se7ty/features/auth/domain/entities/user_entity.dart';
import 'package:se7ty/features/intro/welcome/data/model/user_type_enum.dart';

abstract class AuthRepo {
  Future<Either<String, UserEntity>> login({
    required String email,
    required String password,
  });

  Future<Either<String, UserEntity>> register({
    required String name,
    required String email,
    required String password,
    required UserTypeEnum userType,
  });

  Future<Either<String, void>> forgetPassword({required String email});

  Future<Either<String, void>> saveUserData({required UserTypeEnum userType});
}
