import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ty/features/patient/profile/data/repo/profile_repo.dart';

part 'change_pass_state.dart';

class ChangePassCubit extends Cubit<ChangePassState> {
  ChangePassCubit({required this.profileRepo}) : super(ChangePassInitial());

  final ProfileRepo profileRepo;

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    emit(ChangePassLoading());
    final result = await profileRepo.changePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
    result.fold(
      (l) => emit(ChangePassError(message: l)),
      (r) => emit(ChangePassLoaded()),
    );
  }
}
