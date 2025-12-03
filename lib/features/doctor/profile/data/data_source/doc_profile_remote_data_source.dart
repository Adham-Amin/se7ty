import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:se7ty/core/functions/image_uploader.dart';
import 'package:se7ty/core/services/firebase_service.dart';
import 'package:se7ty/features/auth/data/model/doctor_model.dart';

abstract class DocProfileRemoteDataSource {
  Future<DoctorModel> getUserData();
  Future<void> uploadImage({required File image});
  Future<void> updateUserData({required DoctorModel doctor});
  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  });
}

class DocProfileRemoteDataSourceImpl implements DocProfileRemoteDataSource {
  final FirebaseService firebaseService;
  DocProfileRemoteDataSourceImpl({required this.firebaseService});

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
}
