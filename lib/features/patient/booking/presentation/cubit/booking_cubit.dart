import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ty/features/patient/appointments/data/model/appointments_model.dart';
import 'package:se7ty/features/patient/booking/data/repo/booking_repo.dart';
part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit({required this.bookingRepo}) : super(BookingInitial());

  final BookingRepo bookingRepo;

  Future<void> bookAppointment({required AppointmentModel appointment}) async {
    emit(BookingLoading());
    final result = await bookingRepo.bookAppointment(appointment: appointment);
    result.fold(
      (l) => emit(BookingError(message: l)),
      (r) => emit(BookingLoaded()),
    );
  }
}
