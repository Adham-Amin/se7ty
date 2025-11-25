import 'package:flutter/material.dart';
import 'package:se7ty/core/widgets/doctor_card.dart';
import 'package:se7ty/core/widgets/height_and_width.dart';
import 'package:se7ty/features/auth/data/model/doctor_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingDoctors extends StatelessWidget {
  const LoadingDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.separated(
        itemCount: 3,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
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
