import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ty/core/widgets/custom_button.dart';
import 'package:se7ty/core/widgets/custom_snack_bar.dart';
import 'package:se7ty/core/widgets/custom_text_form_field.dart';
import 'package:se7ty/core/widgets/custom_text_form_field_password.dart';
import 'package:se7ty/core/widgets/loading_dialog.dart';
import 'package:se7ty/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:se7ty/features/intro/welcome/data/model/user_type_enum.dart';

class FormRegister extends StatefulWidget {
  const FormRegister({super.key, required this.userType});

  final UserTypeEnum userType;

  @override
  State<FormRegister> createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController userNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: userNameController,
            keyboardType: TextInputType.text,
            hintText: 'اسم المستخدم',
            prefixIcon: Icon(Icons.person),
            validator: (value) {
              if (value!.isEmpty) {
                return 'من فضلك ادخل الاسم';
              } else {
                return null;
              }
            },
          ),
          SizedBox(height: 16.h),
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
          SizedBox(height: 32.h),
          BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthLoaded) {
                Navigator.pop(context);
                if (state.user.userType == UserTypeEnum.patient.name) {
                  customSnackBar(
                    context: context,
                    message: 'تم انشاء الحساب مريض',
                    type: AnimatedSnackBarType.success,
                  );
                } else if (state.user.userType == UserTypeEnum.doctor.name) {
                  customSnackBar(
                    context: context,
                    message: 'تم انشاء الحساب دكتور',
                    type: AnimatedSnackBarType.success,
                  );
                }
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
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  context.read<AuthCubit>().register(
                    name: userNameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                    userType: widget.userType,
                  );
                }
              },
              title: "انشاء حساب جديد",
            ),
          ),
        ],
      ),
    );
  }
}
