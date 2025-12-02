import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:se7ty/features/auth/data/model/patient_model.dart';

abstract class ProfileRepo {
  Future<Either<String, PatientModel>> getProfile();
  Future<Either<String, PatientModel>> updateProfile({
    required PatientModel patient,
  });
  Future<Either<String, void>> changePassword({
    required String oldPassword,
    required String newPassword,
  });
  Future<Either<String, PatientModel>> uploadImage({required File image});
}
