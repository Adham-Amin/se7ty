import 'dart:io';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:se7ty/core/widgets/custom_button.dart';
import 'package:se7ty/core/widgets/custom_snack_bar.dart';
import 'package:se7ty/core/widgets/loading_dialog.dart';
import 'package:se7ty/features/auth/data/model/doctor_model.dart';
import 'package:se7ty/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:se7ty/features/auth/presentation/widgets/about_section.dart';
import 'package:se7ty/features/auth/presentation/widgets/clinic_address_section.dart';
import 'package:se7ty/features/auth/presentation/widgets/phone_numbers_section.dart';
import 'package:se7ty/features/auth/presentation/widgets/profile_image_picker.dart';
import 'package:se7ty/features/auth/presentation/widgets/speciality_section.dart';
import 'package:se7ty/features/auth/presentation/widgets/work_hours_section.dart';

class DoctorRegisterViewBody extends StatefulWidget {
  const DoctorRegisterViewBody({super.key});

  @override
  State<DoctorRegisterViewBody> createState() => _DoctorRegisterViewBodyState();
}

class _DoctorRegisterViewBodyState extends State<DoctorRegisterViewBody> {
  final formKey = GlobalKey<FormState>();

  late TextEditingController aboutController;
  late TextEditingController addressController;
  late TextEditingController openHourController;
  late TextEditingController closeHourController;
  late TextEditingController phone1Controller;
  late TextEditingController phone2Controller;

  @override
  void initState() {
    super.initState();
    aboutController = TextEditingController();
    addressController = TextEditingController();
    openHourController = TextEditingController();
    closeHourController = TextEditingController();
    phone1Controller = TextEditingController();
    phone2Controller = TextEditingController();
  }

  @override
  void dispose() {
    aboutController.dispose();
    addressController.dispose();
    openHourController.dispose();
    closeHourController.dispose();
    phone1Controller.dispose();
    phone2Controller.dispose();
    super.dispose();
  }

  File? profileImage;
  String? selectedSpecialization;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.h),
            ProfileImagePicker(
              file: profileImage,
              onPick: (file) => setState(() => profileImage = file),
            ),
            SizedBox(height: 24.h),
            SpecialitySection(
              value: selectedSpecialization,
              speciality: (value) {
                setState(() {
                  selectedSpecialization = value;
                });
              },
            ),
            SizedBox(height: 16.h),
            AboutSection(controller: aboutController),
            SizedBox(height: 16.h),
            Divider(),
            SizedBox(height: 16.h),
            ClinicAddressSection(controller: addressController),
            SizedBox(height: 16.h),
            WorkHoursSection(
              openHourController: openHourController,
              closeHourController: closeHourController,
            ),
            SizedBox(height: 16.h),
            PhoneNumbersSection(
              phone1: phone1Controller,
              phone2: phone2Controller,
            ),
            SizedBox(height: 24.h),
            BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthDoctorLoaded) {
                  Navigator.pop(context);
                  customSnackBar(
                    context: context,
                    message: 'تم تحديث الحساب بنجاح',
                    type: AnimatedSnackBarType.success,
                  );
                }
                if (state is AuthError) {
                  Navigator.pop(context);
                  customSnackBar(
                    context: context,
                    message: state.message,
                    type: AnimatedSnackBarType.error,
                  );
                }
                if (state is AuthLoading) {
                  loadingDialog(context);
                }
              },
              child: CustomButton(
                title: 'حفظ البيانات',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (profileImage != null &&
                        selectedSpecialization != null) {
                      context.read<AuthCubit>().doctorRegister(
                        image: profileImage!,
                        doctor: DoctorModel(
                          rating: 3,
                          bio: aboutController.text,
                          address: addressController.text,
                          openHour: openHourController.text,
                          closeHour: closeHourController.text,
                          phone1: phone1Controller.text,
                          phone2: phone2Controller.text,
                          specialization: selectedSpecialization,
                        ),
                      );
                    } else {
                      customSnackBar(
                        context: context,
                        message: 'من فضلك ادخل الصوره والتخصص',
                        type: AnimatedSnackBarType.warning,
                      );
                    }
                  }
                },
              ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
