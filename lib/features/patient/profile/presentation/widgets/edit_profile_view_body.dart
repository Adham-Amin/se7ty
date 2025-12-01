import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ty/core/routes/app_routes.dart';
import 'package:se7ty/core/services/shared_preferences_service.dart';
import 'package:se7ty/core/utils/app_colors.dart';
import 'package:se7ty/core/widgets/custom_button.dart';
import 'package:se7ty/core/widgets/height_and_width.dart';
import 'package:se7ty/features/auth/data/model/patient_model.dart';
import 'package:se7ty/features/patient/profile/presentation/cubit/profile_cubit.dart';
import 'package:se7ty/features/patient/profile/presentation/widgets/edit_item.dart';
import 'package:se7ty/features/patient/profile/presentation/widgets/loading_edit_profile.dart';
import 'package:se7ty/features/patient/profile/presentation/widgets/open_edit_dialog.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  late PatientModel patient;

  @override
  void initState() {
    super.initState();
    patient = Prefs.getUser()!;
  }

  void _updateProfile(PatientModel newData) {
    context.read<ProfileCubit>().updateProfile(patient: newData);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoaded) {
            final p = state.patient;
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        HeightBox(24),
                        EditItem(
                          title: 'الاسم',
                          value: p.name ?? 'لم يضاف',
                          onTap: () {
                            openEditDialog(
                              title: 'تعديل الاسم',
                              initialValue: p.name ?? '',
                              onSave: (newValue) {
                                _updateProfile(PatientModel(name: newValue));
                              },
                              context: context,
                            );
                          },
                        ),
                        HeightBox(16),
                        EditItem(
                          title: 'رقم الهاتف',
                          value: p.phone ?? 'لم يضاف',
                          onTap: () {
                            openEditDialog(
                              title: 'تعديل رقم الهاتف',
                              initialValue: p.phone ?? '',
                              keyboardType: TextInputType.phone,
                              onSave: (newValue) {
                                _updateProfile(PatientModel(phone: newValue));
                              },
                              context: context,
                            );
                          },
                        ),
                        HeightBox(16),
                        EditItem(
                          title: 'المدينة',
                          value: p.city ?? 'لم يضاف',
                          onTap: () {
                            openEditDialog(
                              title: 'تعديل المدينة',
                              initialValue: p.city ?? '',
                              onSave: (newValue) {
                                _updateProfile(PatientModel(city: newValue));
                              },
                              context: context,
                            );
                          },
                        ),
                        HeightBox(16),
                        EditItem(
                          title: 'نبذة تعريفية',
                          value: p.bio ?? 'لم يضاف',
                          onTap: () {
                            openEditDialog(
                              title: 'تعديل النبذة التعريفية',
                              initialValue: p.bio ?? '',
                              onSave: (newValue) {
                                _updateProfile(PatientModel(bio: newValue));
                              },
                              maxLines: 5,
                              context: context,
                            );
                          },
                        ),
                        HeightBox(16),
                        EditItem(
                          title: 'العمر',
                          value: p.age?.toString() ?? 'لم يضاف',
                          onTap: () {
                            openEditDialog(
                              title: 'تعديل العمر',
                              initialValue: p.age?.toString() ?? '',
                              keyboardType: TextInputType.number,
                              onSave: (newValue) {
                                _updateProfile(PatientModel(age: newValue));
                              },
                              context: context,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                HeightBox(24),
                CustomButton(
                  title: 'تسجيل الخروج',
                  onTap: () {
                    Prefs.clearUserData();
                    FirebaseAuth.instance.signOut();
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.welcomeView,
                      (route) => false,
                    );
                  },
                  colortext: AppColors.white,
                  backgroundColor: Colors.red,
                ),
                HeightBox(32),
              ],
            );
          } else {
            return const LoadingEditProfile();
          }
        },
      ),
    );
  }
}
