import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ty/core/utils/app_colors.dart';
import 'package:se7ty/core/utils/app_styles.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withValues(alpha: .3),
            blurRadius: 15,
            offset: const Offset(5, 5),
          ),
        ],
      ),
      child: TextFormField(
        textInputAction: TextInputAction.search,
        cursorColor: AppColors.primary,
        onTapOutside: (_) => FocusScope.of(context).unfocus(),
        decoration: InputDecoration(
          hintStyle: AppStyles.textRegular16,
          filled: true,
          hintText: 'ابحث عن دكتور',
          suffixIcon: Container(
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.9),
              borderRadius: BorderRadius.circular(16),
            ),
            child: IconButton(
              iconSize: 20,
              splashRadius: 20,
              color: Colors.white,
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ),
        ),
        style: AppStyles.textRegular16,
        onFieldSubmitted: (String value) {},
      ),
    );
  }
}
