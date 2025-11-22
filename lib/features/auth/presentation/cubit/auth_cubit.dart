import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ty/features/auth/data/model/doctor_model.dart';
import 'package:se7ty/features/auth/domain/entities/user_entity.dart';
import 'package:se7ty/features/auth/domain/repo/auth_repo.dart';
import 'package:se7ty/features/intro/welcome/data/model/user_type_enum.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepo}) : super(AuthInitial());

  final AuthRepo authRepo;

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    final result = await authRepo.login(email: email, password: password);
    result.fold(
      (l) => emit(AuthError(message: l)),
      (r) => emit(AuthLoaded(user: r)),
    );
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required UserTypeEnum userType,
  }) async {
    emit(AuthLoading());
    final result = await authRepo.register(
      name: name,
      email: email,
      password: password,
      userType: userType,
    );
    result.fold(
      (l) => emit(AuthError(message: l)),
      (r) => emit(AuthLoaded(user: r)),
    );
  }

  Future<void> forgetPassword({required String email}) async {
    emit(AuthForgetPasswordLoading());
    final result = await authRepo.forgetPassword(email: email);
    result.fold(
      (l) => emit(AuthForgetPasswordError(message: l)),
      (r) => emit(AuthForgetPasswordLoaded()),
    );
  }

  Future<void> doctorRegister({
    required DoctorModel doctor,
    required File image,
  }) async {
    emit(AuthLoading());
    final result = await authRepo.doctorRegister(doctor: doctor, image: image);
    result.fold(
      (l) => emit(AuthError(message: l)),
      (r) => emit(AuthDoctorLoaded()),
    );
  }
}
