import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ty/features/auth/data/model/doctor_model.dart';
import 'package:se7ty/features/patient/search/data/repo/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.searchRepo}) : super(SearchInitial());

  final SearchRepo searchRepo;

  Future<void> searchDoctors({required String name}) async {
    emit(SearchLoading());
    final result = await searchRepo.searchDoctors(name: name);
    result.fold(
      (l) => emit(SearchError(message: l)),
      (r) => emit(SearchLoaded(doctors: r)),
    );
  }
}
