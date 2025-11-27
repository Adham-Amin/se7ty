import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:se7ty/core/routes/app_routes.dart';
import 'package:se7ty/core/widgets/custom_button.dart';
import 'package:se7ty/core/widgets/custom_snack_bar.dart';
import 'package:se7ty/core/widgets/doctor_card.dart';
import 'package:se7ty/core/widgets/height_and_width.dart';
import 'package:se7ty/core/widgets/loading_dialog.dart';
import 'package:se7ty/features/auth/data/model/doctor_model.dart';
import 'package:se7ty/features/patient/appointments/data/model/appointments_model.dart';
import 'package:se7ty/features/patient/booking/presentation/cubit/booking_cubit.dart';
import 'package:se7ty/features/patient/booking/presentation/widgets/booking_form.dart';

class BookingViewBody extends StatefulWidget {
  const BookingViewBody({super.key, required this.doctorModel});

  final DoctorModel doctorModel;

  @override
  State<BookingViewBody> createState() => _BookingViewBodyState();
}

class _BookingViewBodyState extends State<BookingViewBody> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _descriptionController;
  late TextEditingController _dateController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _descriptionController = TextEditingController();
    _dateController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _descriptionController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  int selectedHour = -1;
  List<int> times = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          HeightBox(24),
          IgnorePointer(
            ignoring: true,
            child: DoctorCard(doctor: widget.doctorModel),
          ),
          HeightBox(24),
          BookingForm(
            formKey: _formKey,
            nameController: _nameController,
            phoneController: _phoneController,
            descriptionController: _descriptionController,
            dateController: _dateController,
            onDateTap: () => selectDate(context),
            times: times,
            selectedHour: selectedHour,
            onHourSelected: (h) => setState(() => selectedHour = h),
          ),
          HeightBox(24),
          BlocListener<BookingCubit, BookingState>(
            listener: (context, state) {
              if (state is BookingLoading) {
                loadingDialog(context);
              }
              if (state is BookingLoaded) {
                Navigator.pop(context);
                customSnackBar(
                  context: context,
                  message: 'تم حجز الموعد بنجاح',
                  type: AnimatedSnackBarType.success,
                );
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.patientMainView,
                  (_) => false,
                );
              } else if (state is BookingError) {
                customSnackBar(
                  context: context,
                  message: state.message,
                  type: AnimatedSnackBarType.error,
                );
              }
            },
            child: CustomButton(
              title: 'تأكيد الحجز',
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  if (selectedHour != -1) {
                    final appointment = AppointmentModel(
                      name: _nameController.text,
                      phone: _phoneController.text,
                      description: _descriptionController.text,
                      date: DateTime.parse(
                        '${_dateController.text} ${selectedHour.toString().padLeft(2, '0')}:00:00',
                      ),
                      doctorID: widget.doctorModel.uid ?? '',
                      doctorName: widget.doctorModel.name ?? '',
                      location: widget.doctorModel.address ?? '',
                      isComplete: false,
                      rating: 0,
                      patientID: FirebaseAuth.instance.currentUser!.uid,
                    );
                    context.read<BookingCubit>().bookAppointment(
                      appointment: appointment,
                    );
                  } else {
                    customSnackBar(
                      context: context,
                      message: 'من فضلك اختر وقت الحجز',
                      type: AnimatedSnackBarType.warning,
                    );
                  }
                }
              },
            ),
          ),
          HeightBox(24),
        ],
      ),
    );
  }

  Future<void> selectDate(BuildContext context) async {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    ).then((date) {
      if (date != null) {
        _dateController.text = DateFormat('yyyy-MM-dd').format(date);
        selectedHour = -1;
        times = getAvailableAppointments(
          date,
          widget.doctorModel.openHour ?? "0",
          widget.doctorModel.closeHour ?? "0",
        );
        setState(() {});
      }
    });
  }

  List<int> getAvailableAppointments(
    DateTime date,
    String openHour,
    String closeHour,
  ) {
    List<int> availableTimes = [];
    for (
      int i = int.parse(openHour.split(':')[0]);
      i < int.parse(closeHour.split(':')[0]);
      i++
    ) {
      if (date.day == DateTime.now().day &&
          date.month == DateTime.now().month &&
          date.year == DateTime.now().year) {
        if (i > DateTime.now().hour) {
          availableTimes.add(i);
        }
      } else {
        availableTimes.add(i);
      }
    }
    return availableTimes;
  }
}
