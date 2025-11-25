import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ty/core/widgets/doctor_card.dart';
import 'package:se7ty/core/widgets/empty_doctors.dart';
import 'package:se7ty/core/widgets/height_and_width.dart';
import 'package:se7ty/core/widgets/loading_doctor.dart';
import 'package:se7ty/features/patient/home/presentation/cubit/home_cubit.dart';

class SpecialityViewBody extends StatelessWidget {
  const SpecialityViewBody({super.key, required this.specialityName});

  final String specialityName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 0),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoaded) {
            if (state.doctors.isEmpty) {
              return EmptyDoctors(text: 'التخصص');
            }
            return ListView.separated(
              itemCount: state.doctors.length,
              physics: BouncingScrollPhysics(),
              separatorBuilder: (context, index) => HeightBox(12),
              itemBuilder: (context, index) =>
                  DoctorCard(doctor: state.doctors[index]),
            );
          } else {
            return LoadingDoctors();
          }
        },
      ),
    );
  }
}
