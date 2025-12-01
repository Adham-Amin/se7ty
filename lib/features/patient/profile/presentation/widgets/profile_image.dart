import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:se7ty/core/utils/app_colors.dart';

class ProfileImage extends StatelessWidget {
  final File? file;
  final Function(File?) onPick;
  final String imageUrl;

  const ProfileImage({
    super.key,
    required this.file,
    required this.onPick,
    required this.imageUrl,
  });

  Future<void> _pick(BuildContext context) async {
    final picked = await ImagePicker().pickImage(source: ImageSource.camera);

    if (picked != null) {
      onPick(File(picked.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => _pick(context),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: file != null
                  ? FileImage(file!)
                  : NetworkImage(
                      (imageUrl.isEmpty || imageUrl == 'null')
                          ? 'https://i.pravatar.cc/300'
                          : imageUrl,
                    ),
            ),
            CircleAvatar(
              radius: 15,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.camera_alt_rounded,
                size: 20,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
