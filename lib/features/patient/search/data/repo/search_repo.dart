import 'package:dartz/dartz.dart';
import 'package:se7ty/features/auth/data/model/doctor_model.dart';
import 'package:se7ty/features/patient/search/data/data_sources/search_remote_data_source.dart';

abstract class SearchRepo {
  Future<Either<String, List<DoctorModel>>> searchDoctors({
    required String name,
  });
}

class SearchRepoImpl implements SearchRepo {
  final SearchRemoteDataSource searchRemoteDataSource;
  SearchRepoImpl({required this.searchRemoteDataSource});

  @override
  Future<Either<String, List<DoctorModel>>> searchDoctors({
    required String name,
  }) async {
    try {
      final doctors = await searchRemoteDataSource.searchDoctors(name: name);
      return right(doctors);
    } catch (e) {
      return left(e.toString());
    }
  }
}
