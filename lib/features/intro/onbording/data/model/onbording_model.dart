import 'package:se7ty/core/utils/app_assets.dart';

class OnbordingModel {
  final String image;
  final String title;
  final String description;

  OnbordingModel({
    required this.image,
    required this.title,
    required this.description,
  });

  static List<OnbordingModel> onbordingList = [
    OnbordingModel(
      image: AppAssets.svgsOnOne,
      title: 'ابحث عن دكتور متخصص',
      description:
          'اكتشف مجموعة واسعة من الاطباء الخبراء والمتخصصين في مجالات مختلفة.',
    ),
    OnbordingModel(
      image: AppAssets.svgsOnTwo,
      title: 'سهولة الحجز',
      description: 'احجز المواعيد بضغطة واحدة في اي وقت وفي اي مكان.',
    ),
    OnbordingModel(
      image: AppAssets.svgsOnThree,
      title: 'امن وسري',
      description: 'كن مطمئنا لان خصوصيتك وامانك هما اهم اولوياتنا.',
    ),
  ];
}
