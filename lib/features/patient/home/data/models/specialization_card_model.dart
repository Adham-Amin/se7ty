import 'package:flutter/material.dart';

class SpecializationCardModel {
  String specialization;
  final Color primaryColor;
  final Color lightColor;

  SpecializationCardModel({
    required this.specialization,
    required this.primaryColor,
    required this.lightColor,
  });

  static List<SpecializationCardModel> specializationsCard = [
    SpecializationCardModel(
      specialization: 'جراحة عامة',
      primaryColor: Color(0xff71b4fb),
      lightColor: Color(0xffa3d1fb),
    ),
    SpecializationCardModel(
      specialization: "دكتور قلب",
      primaryColor: Color(0xfffa8c73),
      lightColor: Color(0xfffac0b1),
    ),
    SpecializationCardModel(
      specialization: "دكتور اطفال",
      primaryColor: Color(0xff8873f4),
      lightColor: Color(0xffb3a8f5),
    ),
    SpecializationCardModel(
      specialization: "دكتور عظام",
      primaryColor: Color(0xff4cd1bc),
      lightColor: Color(0xff8de3d4),
    ),
    SpecializationCardModel(
      specialization: 'جراجة عيون',
      primaryColor: Color(0xff71b4fb),
      lightColor: Color(0xffa3d1fb),
    ),
    SpecializationCardModel(
      specialization: "دكتور النساء والتوليد",
      primaryColor: Color(0xfffa8c73),
      lightColor: Color(0xfffac0b1),
    ),
    SpecializationCardModel(
      specialization: "دكتور باطنه",
      primaryColor: Color(0xff8873f4),
      lightColor: Color(0xffb3a8f5),
    ),
    SpecializationCardModel(
      specialization: "دكتور اسنان",
      primaryColor: Color(0xff4cd1bc),
      lightColor: Color(0xff8de3d4),
    ),
    SpecializationCardModel(
      specialization: 'انف واذن وحنجرة',
      primaryColor: Color(0xff71b4fb),
      lightColor: Color(0xffa3d1fb),
    ),
    SpecializationCardModel(
      specialization: "التجميلية والترميمية",
      primaryColor: Color(0xfffa8c73),
      lightColor: Color(0xfffac0b1),
    ),
    SpecializationCardModel(
      specialization: "دكتور علاج الصحة النفسية",
      primaryColor: Color(0xff8873f4),
      lightColor: Color(0xffb3a8f5),
    ),
  ];
}
