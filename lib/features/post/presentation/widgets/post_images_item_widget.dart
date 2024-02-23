import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostImagesItemWidget extends StatelessWidget {
  final XFile uploadedImage;
  const PostImagesItemWidget({super.key,required this.uploadedImage});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Image.file(File(uploadedImage.path),fit: BoxFit.cover,),
    );
  }
}
