import 'package:dartz/dartz.dart';
import 'package:se7ty/core/services/shared_preferences_service.dart';
import 'package:se7ty/features/auth/data/model/doctor_model.dart';
import 'package:se7ty/features/doctor/profile/data/data_source/doc_profile_remote_data_source.dart';
import 'package:se7ty/features/doctor/profile/data/repo/doc_profile_repo.dart';
import 'package:se7ty/features/patient/appointments/data/model/appointments_model.dart';

class DocProfileRepoImpl implements DocProfileRepo {
  final DocProfileRemoteDataSource docProfileRemoteDataSource;
  DocProfileRepoImpl({required this.docProfileRemoteDataSource});

  @override
  Future<Either<String, void>> changePassword({
    required String newPassword,
  }) async {
    try {
      await docProfileRemoteDataSource.changePassword(newPassword: newPassword);
      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, DoctorModel>> getProfile() async {
    try {
      final doctor = await docProfileRemoteDataSource.getUserData();
      Prefs.setDoctor(doctor);
      return right(doctor);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, DoctorModel>> updateProfile({
    required DoctorModel doctor,
  }) async {
    try {
      await docProfileRemoteDataSource.updateUserData(doctor: doctor);
      final updatedPatient = await docProfileRemoteDataSource.getUserData();
      return right(updatedPatient);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, DoctorModel>> uploadImage({required image}) async {
    try {
      await docProfileRemoteDataSource.uploadImage(image: image);
      final updatedPatient = await docProfileRemoteDataSource.getUserData();
      return right(updatedPatient);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<AppointmentModel>>> getAppointments() async {
    try {
      final appointments = await docProfileRemoteDataSource.getAppointments();
      return right(appointments);
    } catch (e) {
      return left(e.toString());
    }
  }
}
