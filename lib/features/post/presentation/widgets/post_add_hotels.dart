import 'package:finder/core/utils/app_colors.dart';
import 'package:finder/features/post/presentation/provider/post_provider.dart';
import 'package:finder/features/post/presentation/widgets/list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostHotels extends StatelessWidget {
  const PostHotels({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PostNotifier>(
        builder: (context, model, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 0.1,
                        blurRadius: 0.2,
                      ),
                    ],
                  ),
                  /*decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),*/
                  child: Row(children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 8),
                        child: TextField(
                          controller: model.hotelTextController,
                          cursorColor: AppColors.primaryColorDark,
                          style: const TextStyle(
                              color: AppColors.black, fontWeight: FontWeight.w400),
                          decoration: const InputDecoration(
                              hintText: 'Enter hotel name',
                              /*hintStyle: TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w400),*/
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.colorTransparent),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.colorTransparent),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.colorTransparent),
                              )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: IconButton(
                        icon: const Icon(
                          Icons.add,
                          color: AppColors.primaryColorDark,
                        ),
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          model.addHotel(model.hotelTextController.text);
                        },
                      ),
                    )
                  ]),
                ),
                model.showHotelError
                    ? const Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Text("Can't add empty text",
                            style: TextStyle(color: Colors.red)),
                      )
                    : const SizedBox(),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: model.hotelsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListItemWidget(
                        title: model.hotelsList[index],
                        onChanged: (v) {
                          // model.hotelsList[index] = v;
                          debugPrint('Item Clicked $v');
                          model.removeHotel(index);
                        });
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Padding(
                      padding: EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Divider(
                        height: 1,
                        color: AppColors.primaryColorLight,
                      ),
                    );
                  },
                ),
              ],
            ));
  }
}
