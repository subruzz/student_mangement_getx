import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sutdent_provider/getx/providers/image_getx.dart';

class ProfilePicSelect extends StatelessWidget {
  const ProfilePicSelect({super.key});

  @override
  Widget build(BuildContext context) {
    final imageGetx = Get.put(ImageController());
    return Stack(children: [
      Obx(
        () {
          return CircleAvatar(
            radius: 80,
            backgroundImage: imageGetx.image.value.isNotEmpty
                ? FileImage(File(imageGetx.image.value))
                : null,
            child:  imageGetx.image.value.isEmpty
                ? const Icon(
                    Icons.person,
                    size: 80,
                  )
                : null,
          );
        },
      ),
      Positioned(
        bottom: 0,
        right: 10,
        child: IconButton(
            onPressed: () async {
              imageGetx.selectImageFromGalleryOrCamera(ImageSource.gallery);
            },
            icon: const Icon(Icons.camera_alt)),
      )
    ]);
  }
}
