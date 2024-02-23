import 'package:flutter/material.dart';

class PlaceHolderItemWidget extends StatelessWidget {
  final String imagePath;
  const PlaceHolderItemWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(imagePath,fit: BoxFit.cover),
        ],
      ),
    );
  }
}
