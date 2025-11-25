import 'package:se7ty/core/services/firebase_service.dart';
import 'package:se7ty/features/auth/data/model/doctor_model.dart';

abstract class SearchRemoteDataSource {
  Future<List<DoctorModel>> searchDoctors({required String name});
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final FirebaseService firebaseService;
  SearchRemoteDataSourceImpl({required this.firebaseService});

  @override
  Future<List<DoctorModel>> searchDoctors({required String name}) async {
    var snapshot = await firebaseService.firestore
        .collection('doctors')
        .orderBy('name')
        .startAt([name])
        .endAt(['$name\uf8ff'])
        .get();

    List<DoctorModel> doctors = [];
    for (var doctor in snapshot.docs) {
      doctors.add(DoctorModel.fromJson(doctor.data()));
    }

    return doctors;
  }
}
