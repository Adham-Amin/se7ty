import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ty/core/utils/app_colors.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/core/widgets/custom_button.dart';
import 'package:se7ty/core/widgets/height_and_width.dart';
import 'package:se7ty/features/patient/appointments/data/model/appointments_model.dart';
import 'package:se7ty/features/patient/appointments/presentation/cubit/appointments_cubit.dart';

class AppointmentExpandedContent extends StatelessWidget {
  const AppointmentExpandedContent({super.key, required this.model});

  final AppointmentModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, right: 10, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'اسم المريض: ${model.name}',
            style: AppStyles.textRegular14.copyWith(color: AppColors.black),
          ),
          HeightBox(12),
          Row(
            children: [
              const Icon(
                Icons.location_on_rounded,
                color: AppColors.primary,
                size: 16,
              ),
              WidthBox(12),
              Text(
                model.location,
                style: AppStyles.textRegular14.copyWith(color: AppColors.black),
              ),
            ],
          ),
          HeightBox(12),
          model.isComplete == false
              ? CustomButton(
                  title: "حذف الحجز",
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (dialogContext) => AlertDialog.adaptive(
                        title: Text("حذف الحجز", style: AppStyles.textBold18),
                        content: Text(
                          "هل متأكد من حذف هذا الحجز؟",
                          style: AppStyles.textRegular16,
                        ),
                        actions: [
                          TextButton(
                            child: Text("لا", style: AppStyles.textRegular12),
                            onPressed: () => Navigator.pop(dialogContext),
                          ),
                          TextButton(
                            child: Text("نعم", style: AppStyles.textRegular12),
                            onPressed: () {
                              context
                                  .read<AppointmentsCubit>()
                                  .deleteAppointment(appointmentId: model.id!);
                              Navigator.pop(dialogContext);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                  backgroundColor: Colors.red,
                  colortext: Colors.white,
                )
              : Text(
                  'تمت الموافقة على الحجز',
                  style: AppStyles.textRegular14.copyWith(
                    color: AppColors.primary,
                  ),
                ),
        ],
      ),
    );
  }
}
