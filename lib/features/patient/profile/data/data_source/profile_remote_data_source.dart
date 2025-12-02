import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:se7ty/core/functions/image_uploader.dart';
import 'package:se7ty/core/services/firebase_service.dart';
import 'package:se7ty/features/auth/data/model/patient_model.dart';

abstract class ProfileRemoteDataSource {
  Future<PatientModel> getUserData();
  Future<void> uploadImage({required File image});
  Future<void> updateUserData({required PatientModel patient});
  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  });
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final FirebaseService firebaseService;
  ProfileRemoteDataSourceImpl({required this.firebaseService});

  @override
  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    final user = firebaseService.auth.currentUser;
    final cred = EmailAuthProvider.credential(
      email: user!.email!,
      password: oldPassword,
    );

    await user.reauthenticateWithCredential(cred);
    await user.updatePassword(newPassword);
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

    if (patient.name != firebaseService.auth.currentUser!.displayName) {
      await firebaseService.auth.currentUser!.updateDisplayName(patient.name);
    }
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
