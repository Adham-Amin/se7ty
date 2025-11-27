part of 'booking_cubit.dart';

sealed class BookingState {}

final class BookingInitial extends BookingState {}

final class BookingLoading extends BookingState {}

final class BookingLoaded extends BookingState {}

final class BookingError extends BookingState {
  final String message;
  BookingError({required this.message});
}
