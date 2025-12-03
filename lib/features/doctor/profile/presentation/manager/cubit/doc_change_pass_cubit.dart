import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ty/features/doctor/profile/data/repo/doc_profile_repo.dart';

part 'doc_change_pass_state.dart';

class DocChangePassCubit extends Cubit<DocChangePassState> {
  DocChangePassCubit({required this.docProfileRepo})
    : super(DocChangePassInitial());

  final DocProfileRepo docProfileRepo;

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    emit(DocChangePassLoading());
    final result = await docProfileRepo.changePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
    result.fold(
      (l) => emit(DocChangePassError(message: l)),
      (r) => emit(DocChangePassLoaded()),
    );
  }
}
