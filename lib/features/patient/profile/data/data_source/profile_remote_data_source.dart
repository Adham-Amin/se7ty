import 'dart:io';
import 'package:se7ty/core/functions/image_uploader.dart';
import 'package:se7ty/core/services/firebase_service.dart';
import 'package:se7ty/features/auth/data/model/patient_model.dart';

abstract class ProfileRemoteDataSource {
  Future<PatientModel> getUserData();
  Future<void> uploadImage({required File image});
  Future<void> updateUserData({required PatientModel patient});
  Future<void> changePassword({required String newPassword});
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final FirebaseService firebaseService;
  ProfileRemoteDataSourceImpl({required this.firebaseService});

  @override
  Future<void> changePassword({required String newPassword}) async {
    await firebaseService.auth.currentUser!.updatePassword(newPassword);
  }

  @override
  Future<PatientModel> getUserData() async {
    var snapshot = await firebaseService.firestore
        .collection('patients')
        .doc(firebaseService.auth.currentUser!.uid)
        .get();
    return PatientModel.fromJson(snapshot.data()!);
  }

  @override
  Future<void> updateUserData({required PatientModel patient}) async {
    await firebaseService.firestore
        .collection('patients')
        .doc(firebaseService.auth.currentUser!.uid)
        .update(patient.toUpdateData());
  }

  @override
  Future<void> uploadImage({required File image}) async {
    var imageUrl = await uploadImageToCloudinary(image);
    await firebaseService.firestore
        .collection('patients')
        .doc(firebaseService.auth.currentUser!.uid)
        .update(PatientModel(image: imageUrl).toUpdateData());
  }
}
