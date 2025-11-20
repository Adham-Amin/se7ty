import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ty/core/utils/app_colors.dart';
import 'package:se7ty/features/intro/onbording/data/model/onbording_model.dart';
import 'package:se7ty/features/intro/onbording/presentation/widgets/button_next.dart';
import 'package:se7ty/features/intro/onbording/presentation/widgets/button_skip.dart';
import 'package:se7ty/features/intro/onbording/presentation/widgets/onbording_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnbordingViewBody extends StatefulWidget {
  const OnbordingViewBody({super.key});

  @override
  State<OnbordingViewBody> createState() => _OnbordingViewBodyState();
}

class _OnbordingViewBodyState extends State<OnbordingViewBody> {
  late PageController pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      child: Column(
        children: [
          ButtonSkip(currentPage: currentPage, pageController: pageController),
          Spacer(),
          Expanded(
            flex: 4,
            child: PageView.builder(
              controller: pageController,
              itemCount: OnbordingModel.onbordingList.length,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (context, index) =>
                  OnbordingItem(item: OnbordingModel.onbordingList[index]),
            ),
          ),
          Spacer(),
          Row(
            children: [
              SmoothPageIndicator(
                controller: pageController,
                count: OnbordingModel.onbordingList.length,
                effect: ExpandingDotsEffect(
                  dotWidth: 15,
                  dotHeight: 10,
                  expansionFactor: 2,
                  dotColor: AppColors.grey,
                  activeDotColor: AppColors.primary,
                ),
              ),
              Spacer(),
              ButtonNext(currentPage: currentPage),
            ],
          ),
        ],
      ),
    );
  }
}
