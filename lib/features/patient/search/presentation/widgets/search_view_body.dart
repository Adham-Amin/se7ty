import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ty/core/widgets/doctor_card.dart';
import 'package:se7ty/core/widgets/height_and_width.dart';
import 'package:se7ty/features/auth/data/model/doctor_model.dart';
import 'package:se7ty/features/patient/home/presentation/widgets/search_section.dart';

class PatientSearchViewBody extends StatelessWidget {
  const PatientSearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          HeightBox(24),
          SearchSection(),
          HeightBox(24),
          Expanded(
            child: ListView.separated(
              itemCount: 12,
              physics: BouncingScrollPhysics(),
              separatorBuilder: (context, index) => HeightBox(12),
              itemBuilder: (context, index) => DoctorCard(
                doctor: DoctorModel(
                  name: 'ادهم امين',
                  image:
                      'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                  specialization: 'اطفال',
                  rating: 4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
