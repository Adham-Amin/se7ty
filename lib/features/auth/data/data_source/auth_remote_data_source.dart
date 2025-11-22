import 'package:se7ty/core/services/firebase_service.dart';
import 'package:se7ty/features/auth/data/model/doctor_model.dart';
import 'package:se7ty/features/auth/data/model/patient_model.dart';
import 'package:se7ty/features/auth/domain/entities/user_entity.dart';
import 'package:se7ty/features/intro/welcome/data/model/user_type_enum.dart';

abstract class AuthRemoteDataSource {
  Future<UserEntity> login({required String email, required String password});
  Future<UserEntity> register({
    required String name,
    required String email,
    required String password,
    required UserTypeEnum userType,
  });

  Future<void> forgetPassword({required String email});

  Future<void> saveUserData({required UserTypeEnum userType});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseService firebaseService;
  AuthRemoteDataSourceImpl({required this.firebaseService});

  @override
  Future<UserEntity> login({
    required String email,
    required String password,
  }) async {
    final credential = await firebaseService.auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return UserEntity(
      id: credential.user?.uid ?? '',
      name: credential.user?.displayName ?? '',
      email: credential.user?.email ?? '',
      userType: credential.user?.photoURL ?? '',
    );
  }

  @override
  Future<UserEntity> register({
    required String name,
    required String email,
    required String password,
    required UserTypeEnum userType,
  }) async {
    final credential = await firebaseService.auth
        .createUserWithEmailAndPassword(email: email, password: password);

    final user = credential.user!;

    await user.updateDisplayName(name);
    await user.updatePhotoURL(
      userType == UserTypeEnum.doctor ? 'doctor' : 'patient',
    );

    await user.reload();

    final updatedUser = firebaseService.auth.currentUser!;

    return UserEntity(
      id: updatedUser.uid,
      name: updatedUser.displayName ?? '',
      email: updatedUser.email ?? '',
      userType: updatedUser.photoURL ?? '',
    );
  }

  @override
  Future<void> forgetPassword({required String email}) async {
    await firebaseService.auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> saveUserData({required UserTypeEnum userType}) async {
    if (userType == UserTypeEnum.doctor) {
      final doctor = DoctorModel(
        uid: firebaseService.auth.currentUser!.uid,
        name: firebaseService.auth.currentUser!.displayName,
        email: firebaseService.auth.currentUser!.email,
        image: firebaseService.auth.currentUser!.photoURL,
      );
      await firebaseService.firestore
          .collection('doctors')
          .doc(firebaseService.auth.currentUser!.uid)
          .set(doctor.toJson());
    } else {
      final patient = PatientModel(
        uid: firebaseService.auth.currentUser!.uid,
        name: firebaseService.auth.currentUser!.displayName,
        email: firebaseService.auth.currentUser!.email,
        image: firebaseService.auth.currentUser!.photoURL,
      );
      await firebaseService.firestore
          .collection('patients')
          .doc(firebaseService.auth.currentUser!.uid)
          .set(patient.toJson());
    }
  }
}
