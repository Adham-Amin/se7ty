import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ty/core/widgets/doctor_card.dart';
import 'package:se7ty/core/widgets/empty_doctors.dart';
import 'package:se7ty/core/widgets/height_and_width.dart';
import 'package:se7ty/core/widgets/loading_doctor.dart';
import 'package:se7ty/features/patient/home/presentation/widgets/search_section.dart';
import 'package:se7ty/features/patient/search/presentation/cubit/search_cubit.dart';

class PatientSearchViewBody extends StatelessWidget {
  const PatientSearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          HeightBox(24),
          SearchSection(
            onChange: (q) {
              context.read<SearchCubit>().searchDoctors(name: q);
            },
          ),
          HeightBox(24),
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is SearchLoaded) {
                if (state.doctors.isEmpty) {
                  return Expanded(child: EmptyDoctors(text: 'الاسم'));
                }
                return Expanded(
                  child: ListView.separated(
                    itemCount: state.doctors.length,
                    physics: BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => HeightBox(12),
                    itemBuilder: (context, index) =>
                        DoctorCard(doctor: state.doctors[index]),
                  ),
                );
              } else if (state is SearchError || state is SearchLoading) {
                return LoadingDoctors();
              } else {
                return Expanded(child: EmptyDoctors(message: 'ابحث الان'));
              }
            },
          ),
        ],
      ),
    );
  }
}
