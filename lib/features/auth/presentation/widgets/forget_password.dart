import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/core/widgets/custom_button.dart';
import 'package:se7ty/core/widgets/custom_snack_bar.dart';
import 'package:se7ty/core/widgets/custom_text_form_field.dart';
import 'package:se7ty/core/widgets/loading_dialog.dart';
import 'package:se7ty/features/auth/presentation/cubit/auth_cubit.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24.w,
        right: 24.w,
        bottom: MediaQuery.of(context).viewInsets.bottom + 32.h,
      ),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            Divider(thickness: 5, endIndent: 132.w, indent: 132.w),
            const SizedBox(height: 24),
            Text('استعادة كلمة السر', style: AppStyles.textBold18),
            SizedBox(height: 16.h),
            Text(
              'ادخل البريد الالكتروني للحصول على كلمة السر',
              style: AppStyles.textRegular14,
            ),
            SizedBox(height: 24.h),
            CustomTextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              hintText: 'البريد الالكتروني',
              prefixIcon: Icon(Icons.email_rounded),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'من فضلك ادخل الايميل';
                } else if (RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                    ).hasMatch(value) ==
                    false) {
                  return 'من فضلك ادخل الايميل صحيحا';
                } else {
                  return null;
                }
              },
            ),
            SizedBox(height: 24.h),
            BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthForgetPasswordLoaded) {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  customSnackBar(
                    context: context,
                    message: 'تم ارسال رابط استعادة كلمة السر',
                    type: AnimatedSnackBarType.success,
                  );
                }
                if (state is AuthForgetPasswordError) {
                  customSnackBar(
                    context: context,
                    message: state.message,
                    type: AnimatedSnackBarType.error,
                  );
                }
                if (state is AuthForgetPasswordLoading) {
                  loadingDialog(context);
                }
              },
              child: CustomButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<AuthCubit>().forgetPassword(
                      email: emailController.text,
                    );
                  }
                },
                title: "استعادة كلمة السر",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
