import 'package:finder/core/utils/app_colors.dart';
import 'package:finder/features/post/presentation/provider/post_provider.dart';
import 'package:finder/features/post/presentation/widgets/list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostFood extends StatelessWidget {
  const PostFood({super.key});

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
                  child: Row(children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 8),
                        child: TextField(
                          controller: model.foodTextController,
                            cursorColor: AppColors.primaryColorDark,
                            style: const TextStyle(
                                color: AppColors.black, fontWeight: FontWeight.w400),
                            decoration: const InputDecoration(
                                hintText: 'Enter food / Restaurant',
                                /*hintStyle: TextStyle(
                                    color: AppColors.accentColorDark,
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
                                ))
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: IconButton(
                        icon: const Icon(
                          Icons.add,color: AppColors.primaryColorDark,
                        ),
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          model.addFood(model.foodTextController.text);
                        },
                      ),
                    )
                  ]),
                ),
                model.showFoodError?const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text("Can't add empty text",style: TextStyle(color: Colors.red)),
                ): const SizedBox(),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: model.foodList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListItemWidget(
                        title: model.foodList[index],
                        onChanged: (v) {
                          debugPrint('Item Clicked $v');
                          model.removeFood(index);
                        });
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Padding(
                      padding: EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Divider(
                        height: 1,
                        color: AppColors.separator,
                      ),
                    );
                  },
                ),
              ],
            ));
  }
}
