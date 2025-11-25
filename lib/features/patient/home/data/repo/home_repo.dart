import 'package:dartz/dartz.dart';
import 'package:se7ty/features/auth/data/model/doctor_model.dart';
import 'package:se7ty/features/patient/home/data/data_sources/home_remote_data_source.dart';

abstract class HomeRepo {
  Future<Either<String, List<DoctorModel>>> getTopRatedDoctors();
  Future<Either<String, List<DoctorModel>>> getDoctorsBySpecialty({
    required String specialty,
  });
}

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepoImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<String, List<DoctorModel>>> getDoctorsBySpecialty({
    required String specialty,
  }) async {
    try {
      final doctors = await homeRemoteDataSource.getDoctorsBySpecialty(
        specialty: specialty,
      );
      return right(doctors);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<DoctorModel>>> getTopRatedDoctors() async {
    try {
      final doctors = await homeRemoteDataSource.getTopRatedDoctors();
      return right(doctors);
    } catch (e) {
      return left(e.toString());
    }
  }
}
