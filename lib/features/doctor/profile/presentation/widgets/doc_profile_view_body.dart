import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ty/core/utils/app_colors.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/core/widgets/height_and_width.dart';
import 'package:se7ty/features/auth/data/model/patient_model.dart';
import 'package:se7ty/features/doctor/profile/presentation/manager/doc_profile_cubit/doc_profile_cubit.dart';
import 'package:se7ty/features/doctor/profile/presentation/widgets/my_appointment_doc.dart';
import 'package:se7ty/features/patient/profile/presentation/widgets/loading_profile.dart';
import 'package:se7ty/features/patient/profile/presentation/widgets/patient_contact_s_section.dart';
import 'package:se7ty/features/patient/profile/presentation/widgets/profile_image.dart';

class DocProfileViewBody extends StatefulWidget {
  const DocProfileViewBody({super.key});

  @override
  State<DocProfileViewBody> createState() => _DocProfileViewBodyState();
}

class _DocProfileViewBodyState extends State<DocProfileViewBody> {
  File? image;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: BlocBuilder<DocProfileCubit, DocProfileState>(
        builder: (context, state) {
          if (state is DocProfileLoaded) {
            final doctor = state.doctor;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeightBox(24),
                Row(
                  children: [
                    ProfileImage(
                      file: image,
                      onPick: (file) {
                        setState(() => image = file);
                        context.read<DocProfileCubit>().uploadImage(
                          image: file!,
                        );
                      },
                      imageUrl: doctor.image ?? 'https://i.pravatar.cc/300',
                    ),
                    WidthBox(16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctor.name ?? 'لم تضاف',
                          style: AppStyles.textBold16.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                        HeightBox(8),
                        Text(
                          doctor.address ?? 'لم تضاف',
                          style: AppStyles.textRegular16,
                        ),
                      ],
                    ),
                  ],
                ),
                HeightBox(24),
                Text("نبذه تعريفية", style: AppStyles.textBold16),
                HeightBox(12),
                Text(doctor.bio ?? 'لم تضاف', style: AppStyles.textRegular16),
                Divider(height: 48.h),
                Text("معلومات الاتصال", style: AppStyles.textBold16),
                HeightBox(12),
                PatientContactSSection(
                  email: doctor.email,
                  phone: doctor.phone1,
                  phone2: doctor.phone2,
                ),
                Divider(height: 48.h),
                MyAppointmentDoc(),
              ],
            );
          } else {
            final patient = PatientModel();
            return LoadingProfile(image: image, patient: patient);
          }
        },
      ),
    );
  }
}
