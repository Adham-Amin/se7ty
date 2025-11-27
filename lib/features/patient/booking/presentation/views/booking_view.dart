import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ty/core/services/firebase_service.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/features/auth/data/model/doctor_model.dart';
import 'package:se7ty/features/patient/booking/data/data_source/booking_remote_data_source.dart';
import 'package:se7ty/features/patient/booking/data/repo/booking_repo.dart';
import 'package:se7ty/features/patient/booking/presentation/cubit/booking_cubit.dart';
import 'package:se7ty/features/patient/booking/presentation/widgets/booking_view_body.dart';

class BookingView extends StatelessWidget {
  const BookingView({super.key, required this.doctorModel});
  final DoctorModel doctorModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookingCubit(
        bookingRepo: BookingRepoImpl(
          bookingRemoteDataSource: BookingRemoteDataSourceImpl(
            firebaseService: FirebaseService(),
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('احجز مع دكتورك', style: AppStyles.textBold18),
        ),
        body: BookingViewBody(doctorModel: doctorModel),
      ),
    );
  }
}
