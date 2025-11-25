import 'package:se7ty/core/services/firebase_service.dart';
import 'package:se7ty/features/auth/data/model/doctor_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<DoctorModel>> getTopRatedDoctors();
  Future<List<DoctorModel>> getDoctorsBySpecialty({required String specialty});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final FirebaseService firebaseService;
  HomeRemoteDataSourceImpl({required this.firebaseService});

  @override
  Future<List<DoctorModel>> getDoctorsBySpecialty({
    required String specialty,
  }) async {
    var snapshot = await firebaseService.firestore
        .collection('doctors')
        .where('specialization', isEqualTo: specialty)
        .get();

    List<DoctorModel> doctors = [];
    for (var doctor in snapshot.docs) {
      doctors.add(DoctorModel.fromJson(doctor.data()));
    }

    return doctors;
  }

  @override
  Future<List<DoctorModel>> getTopRatedDoctors() async {
    var snapshot = await firebaseService.firestore
        .collection('doctors')
        .orderBy('rating', descending: true)
        .get();

    List<DoctorModel> doctors = [];
    for (var doctor in snapshot.docs) {
      doctors.add(DoctorModel.fromJson(doctor.data()));
    }

    return doctors;
  }
}
