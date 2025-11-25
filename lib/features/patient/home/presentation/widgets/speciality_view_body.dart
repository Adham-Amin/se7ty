import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ty/core/widgets/doctor_card.dart';
import 'package:se7ty/core/widgets/height_and_width.dart';
import 'package:se7ty/features/auth/data/model/doctor_model.dart';

class SpecialityViewBody extends StatelessWidget {
  const SpecialityViewBody({super.key, required this.specialityName});

  final String specialityName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 0),
      child: ListView.separated(
        itemCount: 12,
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) => HeightBox(12),
        itemBuilder: (context, index) => DoctorCard(
          doctor: DoctorModel(
            name: 'ادهم امين',
            image: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
            specialization: 'اطفال',
            rating: 4,
          ),
        ),
      ),
    );
  }
}
