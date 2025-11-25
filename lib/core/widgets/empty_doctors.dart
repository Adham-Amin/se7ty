import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:se7ty/core/utils/app_assets.dart';
import 'package:se7ty/core/utils/app_styles.dart';

class EmptyDoctors extends StatelessWidget {
  const EmptyDoctors({super.key, this.text, this.message});

  final String? text;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppAssets.svgsNoSearch, width: 250.w),
          Text(
            message ?? 'لا يوجد دكتور بهذا $text حاليا',
            style: AppStyles.textBold18,
          ),
        ],
      ),
    );
  }
}
