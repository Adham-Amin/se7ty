import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ty/features/auth/data/model/patient_model.dart';
import 'package:se7ty/features/patient/profile/data/repo/profile_repo.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.profileRepo}) : super(ProfileInitial());

  final ProfileRepo profileRepo;

  Future<void> getProfile() async {
    emit(ProfileLoading());
    final result = await profileRepo.getProfile();
    result.fold(
      (l) => emit(ProfileError(message: l)),
      (r) => emit(ProfileLoaded(patient: r)),
    );
  }

  Future<void> updateProfile({required PatientModel patient}) async {
    emit(ProfileLoading());
    final result = await profileRepo.updateProfile(patient: patient);
    result.fold(
      (l) => emit(ProfileError(message: l)),
      (r) => emit(ProfileLoaded(patient: r)),
    );
  }

  Future<void> uploadImage({required File image}) async {
    emit(ProfileLoading());
    final result = await profileRepo.uploadImage(image: image);
    result.fold(
      (l) => emit(ProfileError(message: l)),
      (r) => emit(ProfileLoaded(patient: r)),
    );
  }
}
