import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:se7ty/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:se7ty/features/auth/data/model/doctor_model.dart';
import 'package:se7ty/features/auth/domain/entities/user_entity.dart';
import 'package:se7ty/features/auth/domain/repo/auth_repo.dart';
import 'package:se7ty/features/intro/welcome/data/model/user_type_enum.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepoImpl({required this.authRemoteDataSource});

  @override
  Future<Either<String, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final user = await authRemoteDataSource.login(
        email: email,
        password: password,
      );
      return right(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return left('المستخدم غير موجود');
      } else if (e.code == 'wrong-password') {
        return left('كلمة المرور غير صحيحة');
      } else {
        return left(e.toString());
      }
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, UserEntity>> register({
    required String name,
    required String email,
    required String password,
    required UserTypeEnum userType,
  }) async {
    try {
      final user = await authRemoteDataSource.register(
        name: name,
        email: email,
        password: password,
        userType: userType,
      );
      saveUserData(userType: userType);
      return right(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return left('كلمة المرور ضعيفة ، يجب ان تكون على الاقل 6 حروف');
      } else if (e.code == 'email-already-in-use') {
        return left('البريد الالكتروني مستخدم بالفعل');
      } else {
        return left(e.toString());
      }
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> forgetPassword({required String email}) async {
    try {
      await authRemoteDataSource.forgetPassword(email: email);
      return right(null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return left('البريد الإلكتروني غير مسجل');
      }
      return left(e.message ?? e.toString());
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> saveUserData({
    required UserTypeEnum userType,
  }) async {
    try {
      await authRemoteDataSource.saveUserData(userType: userType);
      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> doctorRegister({
    required DoctorModel doctor,
    required File image,
  }) async {
    try {
      await authRemoteDataSource.doctorRegister(doctor: doctor, image: image);
      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }
}
