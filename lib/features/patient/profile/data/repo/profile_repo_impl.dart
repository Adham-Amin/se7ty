import 'package:dartz/dartz.dart';
import 'package:se7ty/core/services/shared_preferences_service.dart';
import 'package:se7ty/features/auth/data/model/patient_model.dart';
import 'package:se7ty/features/patient/profile/data/data_source/profile_remote_data_source.dart';
import 'package:se7ty/features/patient/profile/data/repo/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteDataSource profileRemoteDataSource;
  ProfileRepoImpl({required this.profileRemoteDataSource});

  @override
  Future<Either<String, void>> changePassword({
    required String newPassword,
  }) async {
    try {
      await profileRemoteDataSource.changePassword(newPassword: newPassword);
      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, PatientModel>> getProfile() async {
    try {
      final patient = await profileRemoteDataSource.getUserData();
      Prefs.setUser(patient);
      return right(patient);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, PatientModel>> updateProfile({
    required PatientModel patient,
  }) async {
    try {
      await profileRemoteDataSource.updateUserData(patient: patient);
      final updatedPatient = await profileRemoteDataSource.getUserData();
      return right(updatedPatient);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, PatientModel>> uploadImage({required image}) async {
    try {
      await profileRemoteDataSource.uploadImage(image: image);
      final updatedPatient = await profileRemoteDataSource.getUserData();
      return right(updatedPatient);
    } catch (e) {
      return left(e.toString());
    }
  }
}
