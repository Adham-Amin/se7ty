import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ty/features/auth/data/model/doctor_model.dart';
import 'package:se7ty/features/doctor/profile/data/repo/doc_profile_repo.dart';

part 'doc_profile_state.dart';

class DocProfileCubit extends Cubit<DocProfileState> {
  DocProfileCubit({required this.docProfileRepo}) : super(DocProfileInitial());

  final DocProfileRepo docProfileRepo;

  Future<void> getProfile() async {
    emit(DocProfileLoading());
    final result = await docProfileRepo.getProfile();
    result.fold(
      (l) => emit(DocProfileError(message: l)),
      (r) => emit(DocProfileLoaded(doctor: r)),
    );
  }

  Future<void> updateProfile({required DoctorModel doctor}) async {
    emit(DocProfileLoading());
    final result = await docProfileRepo.updateProfile(doctor: doctor);
    result.fold(
      (l) => emit(DocProfileError(message: l)),
      (r) => emit(DocProfileLoaded(doctor: r)),
    );
  }

  Future<void> uploadImage({required File image}) async {
    emit(DocProfileLoading());
    final result = await docProfileRepo.uploadImage(image: image);
    result.fold(
      (l) => emit(DocProfileError(message: l)),
      (r) => emit(DocProfileLoaded(doctor: r)),
    );
  }

  Future<void> changePassword({required String newPassword}) async {
    emit(DocProfileLoading());
    final result = await docProfileRepo.changePassword(
      newPassword: newPassword,
    );
    result.fold(
      (l) => emit(DocProfileError(message: l)),
      (r) => emit(DocProfileChangePassword()),
    );
  }
}
