import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:se7ty/core/utils/app_colors.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/core/widgets/height_and_width.dart';
import 'package:se7ty/features/patient/appointments/data/model/appointments_model.dart';

class DoctorAppointmentSubtitle extends StatelessWidget {
  const DoctorAppointmentSubtitle({super.key, required this.model});

  final AppointmentModel model;

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return now.year == date.year &&
        now.month == date.month &&
        now.day == date.day;
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = _isToday(model.date)
        ? "اليوم"
        : DateFormat.yMMMMd('ar').format(model.date);

    final formattedTime = DateFormat.jm('ar').format(model.date);

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.calendar_month_rounded,
                color: AppColors.primary,
                size: 16,
              ),
              WidthBox(12),
              Text(
                formattedDate,
                style: AppStyles.textRegular14.copyWith(color: AppColors.black),
              ),
            ],
          ),
          HeightBox(8),
          Row(
            children: [
              const Icon(
                Icons.watch_later_outlined,
                color: AppColors.primary,
                size: 16,
              ),
              WidthBox(12),
              Text(
                formattedTime,
                style: AppStyles.textRegular14.copyWith(color: AppColors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
