import 'package:flutter/material.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/features/patient/search/presentation/widgets/search_view_body.dart';

class PatientSearchView extends StatelessWidget {
  const PatientSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('البحث', style: AppStyles.textBold18),
      ),
      body: PatientSearchViewBody(),
    );
  }
}
