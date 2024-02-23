import 'package:finder/features/post/presentation/provider/post_provider.dart';
import 'package:finder/features/post/presentation/widgets/post_images_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostImagesWidget extends StatelessWidget {
  const PostImagesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PostNotifier>(
      builder: (context, model, child) {
        return Column(
          children: [
            const SizedBox(height: 16.0),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: model.uploadedImages.length,
                itemBuilder: (context, index) {
                  final Widget destiny = SizedBox(
                    width: 150.0,
                    height: 120.0,
                    child: PostImagesItemWidget(
                        uploadedImage: model.uploadedImages[index]),
                  );
                  if (index < model.uploadedImages.length - 1) {
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
      },
    );
  }
}
