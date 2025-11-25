import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ty/features/auth/data/model/doctor_model.dart';
import 'package:se7ty/features/patient/home/data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeRepo}) : super(HomeInitial());

  final HomeRepo homeRepo;

  Future<void> getTopRateDoctors() async {
    emit(HomeLoading());
    final result = await homeRepo.getTopRatedDoctors();
    result.fold(
      (l) => emit(HomeError(message: l)),
      (r) => emit(HomeLoaded(doctors: r)),
    );
  }

  Future<void> getDoctorsBySpecialty({required String specialty}) async {
    emit(HomeLoading());
    final result = await homeRepo.getDoctorsBySpecialty(specialty: specialty);
    result.fold(
      (l) => emit(HomeError(message: l)),
      (r) => emit(HomeLoaded(doctors: r)),
    );
  }
}
