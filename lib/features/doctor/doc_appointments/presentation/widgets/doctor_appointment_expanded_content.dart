import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ty/core/utils/app_colors.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/core/widgets/custom_button.dart';
import 'package:se7ty/core/widgets/height_and_width.dart';
import 'package:se7ty/features/doctor/doc_appointments/presentation/cubit/doc_appointments_cubit.dart';
import 'package:se7ty/features/patient/appointments/data/model/appointments_model.dart';

class DoctorAppointmentExpandedContent extends StatelessWidget {
  const DoctorAppointmentExpandedContent({super.key, required this.model});

  final AppointmentModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, right: 10, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'رقم المريض: ${model.phone}',
            style: AppStyles.textRegular14.copyWith(color: AppColors.black),
          ),
          HeightBox(10),
          Text(
            'الوصف: ${model.description}',
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
          HeightBox(16),
          if (!model.isComplete)
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    title: "موافقة",
                    backgroundColor: AppColors.primary,
                    colortext: Colors.white,
                    onTap: () {
                      context.read<DocAppointmentsCubit>().acceptAppointment(
                        appointmentId: model.id!,
                      );
                    },
                  ),
                ),
                WidthBox(10),
                Expanded(
                  child: CustomButton(
                    title: "رفض",
                    backgroundColor: Colors.red,
                    colortext: Colors.white,
                    onTap: () {
                      context.read<DocAppointmentsCubit>().deleteAppointment(
                        appointmentId: model.id!,
                      );
                    },
                  ),
                ),
              ],
            )
          else
            Text(
              "تمت الموافقة على الحجز",
              style: AppStyles.textRegular14.copyWith(color: AppColors.primary),
            ),
        ],
      ),
    );
  }
}
