import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/core/widgets/custom_button.dart';
import 'package:se7ty/core/widgets/custom_text_form_field.dart';
import 'package:se7ty/core/widgets/custom_text_form_field_password.dart';
import 'package:se7ty/features/auth/presentation/widgets/forget_password.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        SizedBox(height: 16.h),
        CustomTextFormFieldPassword(
          controller: passwordController,
          hintText: '********',
          validator: (value) {
            if (value!.isEmpty) return 'من فضلك ادخل كلمة السر';
            return null;
          },
        ),
        Align(
          alignment: AlignmentGeometry.centerRight,
          child: TextButton(
            onPressed: () {
              showBottomSheet(
                context: context,
                builder: (context) => ForgetPassword(),
              );
            },
            child: Text('نسيت كلمة السر ؟', style: AppStyles.textRegular14),
          ),
        ),
        SizedBox(height: 16.h),
        CustomButton(onTap: () {}, title: "تسجيل الدخول"),
      ],
    );
  }
}
