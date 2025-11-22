import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:se7ty/core/utils/app_assets.dart';
import 'package:se7ty/core/utils/app_colors.dart';

Future<dynamic> loadingDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: AppColors.dark.withValues(alpha: .7),
    builder: (context) => Center(child: Lottie.asset(AppAssets.lottieLoading)),
  );
}
