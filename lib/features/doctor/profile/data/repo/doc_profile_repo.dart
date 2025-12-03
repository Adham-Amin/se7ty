import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:se7ty/features/auth/data/model/doctor_model.dart';

abstract class DocProfileRepo {
  Future<Either<String, DoctorModel>> getProfile();
  Future<Either<String, DoctorModel>> updateProfile({
    required DoctorModel doctor,
  });
  Future<Either<String, void>> changePassword({
    required String oldPassword,
    required String newPassword,
  });
  Future<Either<String, DoctorModel>> uploadImage({required File image});
}
