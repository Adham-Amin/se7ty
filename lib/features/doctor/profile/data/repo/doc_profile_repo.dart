import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:se7ty/features/auth/data/model/doctor_model.dart';
import 'package:se7ty/features/patient/appointments/data/model/appointments_model.dart';

abstract class DocProfileRepo {
  Future<Either<String, DoctorModel>> getProfile();
  Future<Either<String, DoctorModel>> updateProfile({
    required DoctorModel doctor,
  });
  Future<Either<String, void>> changePassword({required String newPassword});
  Future<Either<String, DoctorModel>> uploadImage({required File image});
  Future<Either<String, List<AppointmentModel>>> getAppointments();
}
