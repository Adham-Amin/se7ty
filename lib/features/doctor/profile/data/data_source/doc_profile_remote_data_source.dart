import 'dart:io';
import 'package:se7ty/core/functions/image_uploader.dart';
import 'package:se7ty/core/services/firebase_service.dart';
import 'package:se7ty/features/auth/data/model/doctor_model.dart';
import 'package:se7ty/features/patient/appointments/data/model/appointments_model.dart';

abstract class DocProfileRemoteDataSource {
  Future<DoctorModel> getUserData();
  Future<void> uploadImage({required File image});
  Future<void> updateUserData({required DoctorModel doctor});
  Future<void> changePassword({required String newPassword});
  Future<List<AppointmentModel>> getAppointments();
}

class DocProfileRemoteDataSourceImpl implements DocProfileRemoteDataSource {
  final FirebaseService firebaseService;
  DocProfileRemoteDataSourceImpl({required this.firebaseService});

  @override
  Future<void> changePassword({required String newPassword}) async {
    await firebaseService.auth.currentUser!.updatePassword(newPassword);
  }

  @override
  Future<DoctorModel> getUserData() async {
    var snapshot = await firebaseService.firestore
        .collection('doctors')
        .doc(firebaseService.auth.currentUser!.uid)
        .get();
    return DoctorModel.fromJson(snapshot.data()!);
  }

  @override
  Future<void> updateUserData({required DoctorModel doctor}) async {
    await firebaseService.firestore
        .collection('doctors')
        .doc(firebaseService.auth.currentUser!.uid)
        .update(doctor.toUpdateData());
  }

  @override
  Future<void> uploadImage({required File image}) async {
    var imageUrl = await uploadImageToCloudinary(image);
    await firebaseService.firestore
        .collection('doctors')
        .doc(firebaseService.auth.currentUser!.uid)
        .update(DoctorModel(image: imageUrl).toUpdateData());
  }

  @override
  Future<List<AppointmentModel>> getAppointments() async {
    var snapshot = await firebaseService.firestore
        .collection('appointments')
        .where('doctorID', isEqualTo: firebaseService.auth.currentUser!.uid)
        .get();

    List<AppointmentModel> appointments = [];
    for (var doc in snapshot.docs) {
      appointments.add(AppointmentModel.fromJson(doc.data(), doc.id));
    }

    return appointments;
  }
}
