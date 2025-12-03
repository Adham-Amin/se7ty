import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ty/core/routes/app_routes.dart';
import 'package:se7ty/core/services/shared_preferences_service.dart';
import 'package:se7ty/core/utils/app_colors.dart';
import 'package:se7ty/core/widgets/custom_button.dart';
import 'package:se7ty/core/widgets/height_and_width.dart';
import 'package:se7ty/features/auth/data/model/doctor_model.dart';
import 'package:se7ty/features/doctor/profile/presentation/manager/cubit/doc_change_pass_cubit.dart';
import 'package:se7ty/features/doctor/profile/presentation/manager/doc_profile_cubit/doc_profile_cubit.dart';
import 'package:se7ty/features/patient/profile/presentation/widgets/edit_item.dart';
import 'package:se7ty/features/patient/profile/presentation/widgets/loading_edit_profile.dart';
import 'package:se7ty/features/patient/profile/presentation/widgets/open_edit_dialog.dart';

class EditDocProfileViewBody extends StatefulWidget {
  const EditDocProfileViewBody({super.key});

  @override
  State<EditDocProfileViewBody> createState() => _EditDocProfileViewBodyState();
}

class _EditDocProfileViewBodyState extends State<EditDocProfileViewBody> {
  late DoctorModel doctor;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController oldPassController, newPassController;

  @override
  void initState() {
    super.initState();
    doctor = Prefs.getDoctor()!;
    oldPassController = TextEditingController();
    newPassController = TextEditingController();
  }

  @override
  void dispose() {
    oldPassController.dispose();
    newPassController.dispose();
    super.dispose();
  }

  void _updateProfile(DoctorModel newData) {
    context.read<DocProfileCubit>().updateProfile(doctor: newData);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: BlocBuilder<DocProfileCubit, DocProfileState>(
        builder: (context, state) {
          if (state is DocProfileLoaded) {
            final d = state.doctor;
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        HeightBox(24),
                        EditItem(
                          title: 'الاسم',
                          value: d.name ?? 'لم يضاف',
                          onTap: () {
                            openEditDialog(
                              title: 'تعديل الاسم',
                              initialValue: d.name ?? '',
                              onSave: (newValue) {
                                _updateProfile(DoctorModel(name: newValue));
                              },
                              context: context,
                            );
                          },
                        ),
                        HeightBox(16),
                        EditItem(
                          title: 'رقم الهاتف',
                          value: d.phone1 ?? 'لم يضاف',
                          onTap: () {
                            openEditDialog(
                              title: 'تعديل رقم الهاتف',
                              initialValue: d.phone1 ?? '',
                              keyboardType: TextInputType.phone,
                              onSave: (newValue) {
                                _updateProfile(DoctorModel(phone1: newValue));
                              },
                              context: context,
                            );
                          },
                        ),
                        HeightBox(16),
                        EditItem(
                          title: 'رقم الهاتف الثاني',
                          value: d.phone2 ?? 'لم يضاف',
                          onTap: () {
                            openEditDialog(
                              title: 'تعديل رقم الهاتف الثاني',
                              initialValue: d.phone2 ?? '',
                              keyboardType: TextInputType.phone,
                              onSave: (newValue) {
                                _updateProfile(DoctorModel(phone2: newValue));
                              },
                              context: context,
                            );
                          },
                        ),
                        HeightBox(16),
                        EditItem(
                          title: 'المدينة',
                          value: d.address ?? 'لم يضاف',
                          onTap: () {
                            openEditDialog(
                              title: 'تعديل المدينة',
                              initialValue: d.address ?? '',
                              onSave: (newValue) {
                                _updateProfile(DoctorModel(address: newValue));
                              },
                              context: context,
                            );
                          },
                        ),
                        HeightBox(16),
                        EditItem(
                          title: 'نبذة تعريفية',
                          value: d.bio ?? 'لم يضاف',
                          onTap: () {
                            openEditDialog(
                              title: 'تعديل النبذة التعريفية',
                              initialValue: d.bio ?? '',
                              onSave: (newValue) {
                                _updateProfile(DoctorModel(bio: newValue));
                              },
                              maxLines: 5,
                              context: context,
                            );
                          },
                        ),
                        HeightBox(16),
                        EditItem(
                          title: 'كلمة المرور',
                          value: '********',
                          onTap: () {
                            editPasswordDialog(
                              onTap: () {
                                context
                                    .read<DocChangePassCubit>()
                                    .changePassword(
                                      oldPassword: oldPassController.text,
                                      newPassword: newPassController.text,
                                    );
                                Navigator.pop(context);
                                context.read<DocProfileCubit>().getProfile();
                              },
                              context: context,
                              formKey: formKey,
                              oldPasswordController: oldPassController,
                              newPasswordController: newPassController,
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
