import 'package:flutter/material.dart';

Future<dynamic> showDialogLoading(BuildContext context) {
  return showDialog(
    context: context,
    builder: (_) => const Center(child: CircularProgressIndicator()),
  );
}
