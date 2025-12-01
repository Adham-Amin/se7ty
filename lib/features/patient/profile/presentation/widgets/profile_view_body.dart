import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ty/core/utils/app_colors.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/core/widgets/height_and_width.dart';
import 'package:se7ty/features/auth/data/model/patient_model.dart';
import 'package:se7ty/features/patient/profile/presentation/cubit/profile_cubit.dart';
import 'package:se7ty/features/patient/profile/presentation/widgets/loading_profile.dart';
import 'package:se7ty/features/patient/profile/presentation/widgets/patient_contact_s_section.dart';
import 'package:se7ty/features/patient/profile/presentation/widgets/profile_image.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  File? image;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoaded) {
            final patient = state.patient;
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
                        context.read<ProfileCubit>().uploadImage(image: file!);
                      },
                      imageUrl: patient.image ?? 'https://i.pravatar.cc/300',
                    ),
                    WidthBox(16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          patient.name ?? 'لم تضاف',
                          style: AppStyles.textBold16.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                        HeightBox(8),
                        Text(
                          patient.city ?? 'لم تضاف',
                          style: AppStyles.textRegular16,
                        ),
                      ],
                    ),
                  ],
                ),
                HeightBox(24),
                Text("نبذه تعريفية", style: AppStyles.textBold16),
                HeightBox(12),
                Text(patient.bio ?? 'لم تضاف', style: AppStyles.textRegular16),
                Divider(height: 48.h),
                Text("معلومات الاتصال", style: AppStyles.textBold16),
                HeightBox(12),
                PatientContactSSection(patient: patient),
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
