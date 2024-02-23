import 'package:finder/core/utils/app_colors.dart';
import 'package:finder/features/home/presentation/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const double listViewMargin = 12.0;
const double listTilePadding = 12.0;
const double listTileCornerRadius = 12.0;
const double postImageRadius = 8.0;
const double locationContainerPadding = 6.0;
const double locationContainerLeftPadding = 12.0;
const double locationContainerRadius = 8.0;
const double descriptionPaddingTopBottom = 12.0;
const double descriptionPaddingLefRight = 8.0;
const double userProfileIconRadius = 40.0;
const double userProfileIconSize = 40.0;

class StoriesList extends StatelessWidget {
  const StoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Consumer<HomeProvider>(builder: (context, data, _) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: data.listData.length,
        itemBuilder: (context, index) {
          final item = data.listData[index];
          //List Item
          return Container(
            margin: const EdgeInsets.only(
                top: listViewMargin,
                left: listViewMargin,
                right: listViewMargin),
            padding: const EdgeInsets.all(listTilePadding),
            decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius:
                    BorderRadius.all(Radius.circular(listTileCornerRadius))),
            child: Column(
              children: [
                //Post Image with Location and Report buttons
                Stack(
                  children: [
                    //Post Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(postImageRadius),
                      child: FadeInImage(
                        width: width,
                        height: height / 4,
                        fit: BoxFit.fitWidth,
                        image: NetworkImage(item.images!.first),
                        placeholder:
                            const AssetImage("assets/images/placeholder.png"),
                      ),
                    ),
                    //Report Icon
                    Positioned(
                      right: 0,
                      top: 0,
                      child: IconButton(
                        icon: const Icon(
                          Icons.more_vert_outlined,
                          color: AppColors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    //Location with Bookmark
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.only(
                            top: locationContainerPadding,
                            bottom: locationContainerPadding,
                            left: locationContainerLeftPadding),
                        decoration: const BoxDecoration(
                            color: AppColors.whiteTransparent,
                            borderRadius: BorderRadius.only(
                                bottomLeft:
                                    Radius.circular(locationContainerRadius),
                                bottomRight:
                                    Radius.circular(locationContainerRadius))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item.location!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: AppColors.white),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.bookmark_outline_rounded,
                                color: AppColors.white,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                //Description text
                Padding(
                  padding: const EdgeInsets.only(
                      top: descriptionPaddingTopBottom,
                      bottom: descriptionPaddingTopBottom,
                      left: descriptionPaddingLefRight,
                      right: descriptionPaddingLefRight),
                  child: RichText(
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    text: TextSpan(
                      text: item.description,
                      style: const TextStyle(
                          color: AppColors.black, letterSpacing: 0.2),
                    ),
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: AppColors.separator,
                ),
                //post User Info
                Row(
                  children: <Widget>[
                    //User profile image
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(userProfileIconRadius),
                      child: Image(
                        image: NetworkImage(item.user!.userImage!),
                        width: userProfileIconSize,
                        height: userProfileIconSize,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //User name
                        Text(item.user!.userName!),
                        //Posted created date
                        const Text(
                          "Febuary 2020",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColors.gray,
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    //Like button
                    IconButton(
                      icon: const Icon(Icons.favorite_outline_rounded),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
