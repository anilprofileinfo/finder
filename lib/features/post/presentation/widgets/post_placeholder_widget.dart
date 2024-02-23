import 'package:finder/features/post/data/models/placeholder_image_data.dart';
import 'package:finder/features/post/presentation/widgets/post_placeholder_item_widget.dart';
import 'package:flutter/material.dart';

class PostPlaceHolderWidget extends StatelessWidget {
  const PostPlaceHolderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16.0),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: PlaceHolderImageData.imgList.length,
            itemBuilder: (context, index) {
              final Widget destiny = SizedBox(
                width: 150.0,
                height: 120.0,
                child: PlaceHolderItemWidget(
                    imagePath: PlaceHolderImageData.imgList[index]),
              );
              if (index < PlaceHolderImageData.imgList.length - 1) {
                return Row(
                  children: [
                    destiny,
                    const SizedBox(width: 16.0),
                  ],
                );
              }
              return destiny;
            },
          ),
        ),
      ],
    );
  }
}
