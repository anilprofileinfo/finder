import 'package:finder/core/utils/app_colors.dart';
import 'package:finder/features/post/presentation/provider/post_provider.dart';
import 'package:finder/features/post/presentation/widgets/post_add_food.dart';
import 'package:finder/features/post/presentation/widgets/post_add_hotels.dart';
import 'package:finder/features/post/presentation/widgets/post_images_widget.dart';
import 'package:finder/features/post/presentation/widgets/post_placeholder_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});
// suggesstion list
  static const List<String> _fruitOptions = <String>[
    'apple',
    'banana',
    'orange',
    'mango',
    'grapes',
    'watermelon',
    'kiwi',
    'strawberry',
    'sugarcane',
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PostNotifier(),
      child: Consumer<PostNotifier>(
        builder: (context, notifier, child) => Scaffold(
          backgroundColor: AppColors.white,
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            top: true,
            bottom: true,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///Title and Back Icon
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_rounded,
                              // color: AppColors.accentColorDark,
                            )),
                        const Padding(
                          padding: EdgeInsets.only(left: 24.0),
                          child: Text(
                            'Create Blog',
                            style: TextStyle(
                                // color: AppColors.accentColorDark,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),

                  ///Enter Place
                  /*Container(
                    margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: TextFormField(
                      controller: notifier.placeTextController,
                      decoration: InputDecoration(
                        hintText: 'Enter city',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none),
                        fillColor: AppColors.primaryColor.withOpacity(0.2),
                        filled: true,
                      ),
                      style: const TextStyle(color: AppColors.black),
                    ),
                  ),*/
                  // Auto complete widget
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0,right: 16.0),
                    child: Autocomplete<String>(

                      optionsBuilder: (TextEditingValue fruitTextEditingValue) {

                        // if user is input nothing
                        if (fruitTextEditingValue.text == '') {
                          return const Iterable<String>.empty();
                        }

                        // if user is input something the build
                        // suggestion based on the user input
                        return _fruitOptions.where((String option) {
                          return option
                              .contains(fruitTextEditingValue.text.toLowerCase());
                        });
                      },

                      // when user click on the suggested
                      // item this function calls
                      onSelected: (String value) {
                        debugPrint('You just selected $value');
                      },
                    ),
                  ),

                  ///Enter Place info
                  const Padding(
                    padding: EdgeInsets.only(left: 28, right: 8, top: 4),
                    child:
                        Text('Add your travelled place ex: Paris, Bali, Goa.'),
                  ),

                  ///Enter Description
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 24, left: 16, right: 16),
                    child: Container(
                      /*decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            spreadRadius: 0.1,
                            blurRadius: 0.2,
                          ),
                        ],
                      ),*/
                      child: TextField(
                        controller: notifier.descriptionTextController,
                        decoration: const InputDecoration(
                          hintText: 'Add your travel experience',
                          // border: OutlineInputBorder(
                          //     borderRadius: BorderRadius.circular(8),
                          //     borderSide: BorderSide.none),
                          // fillColor: AppColors.primaryColor.withOpacity(0.2),
                          // filled: true,
                        ),
                        style: const TextStyle(color: AppColors.black),
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        // maxLines: 7,
                      ),
                    ),
                  ),

                  ///Enter Description info
                  const Padding(
                    padding: EdgeInsets.only(left: 28, right: 8, top: 4),
                    child: Text(
                        'Describe about your travel experience, Best time to visit and budget of trip.'),
                  ),

                  ///Add Travel Photos
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 24, left: 16, right: 16),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            debugPrint('onPressed');
                            notifier.pickImage();
                          },
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 16, right: 24, top: 16, bottom: 16),
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
                            child: const Row(
                              children: [
                                Text('Add travel photos',
                                    style: TextStyle(
                                        color: AppColors.primaryColorDark,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16)),
                                Spacer(),
                                Icon(
                                  Icons.attachment,
                                  color: AppColors.primaryColorDark,
                                ),
                              ],
                            ),
                          ),
                        ),

                        ///Images Display Widget
                        notifier.uploadedImages.isNotEmpty
                            ? const PostImagesWidget()
                            : const PostPlaceHolderWidget(),
                      ],
                    ),
                  ),

                  ///Recommended Hotels
                  const Padding(
                    padding:
                        EdgeInsets.only(left: 28, right: 8, top: 24, bottom: 8),
                    child: Text('Recommended Hotels (Optional)',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                  /*const Padding(
                    padding: EdgeInsets.only(left: 12, right: 8),
                    child: Text(
                        'Suggest hotels whether you stayed in trip or known best hotels.',
                        style: TextStyle(fontSize: 14)),
                  ),*/
                  const Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: PostHotels(),
                  ),

                  ///Recommended Food
                  const Padding(
                    padding:
                        EdgeInsets.only(left: 28, right: 8, top: 24, bottom: 8),
                    child: Text('Recommended Food (Optional)',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                  /*const Padding(
                    padding: EdgeInsets.only(left: 16, right: widgetPadding),
                    child: Text('Suggest any food or restaurant.',
                        style: TextStyle(fontSize: 14)),
                  ),*/
                  const Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: PostFood(),
                  ),

                  Center(
                    child: Container(
                      padding: const EdgeInsets.only(top: 60, bottom: 20),
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          // Foreground color
                          foregroundColor: Colors.white,
                          backgroundColor: AppColors.primaryColorDark,
                        ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                        onPressed: () async {
                          /*var placeModel = PlaceDataModel(
                              userName: 'Prashant',
                              userImage: '',
                              description: notifier
                                  .descriptionTextController.text
                                  .toString(),
                              images: [
                                'https://api.slingacademy.com/public/sample-photos/1.jpeg',
                                'https://api.slingacademy.com/public/sample-photos/2.jpeg',
                                'https://api.slingacademy.com/public/sample-photos/3.jpeg'
                              ],
                              placeName:
                                  notifier.placeTextController.text.toString(),
                              userId: '', isFavorite: false);
                          var listOfPlace = <PlaceDataModel>[];
                          listOfPlace.add(placeModel);
                          await HiveRepository().savePlaceDetails(listOfPlace);*/
                          Navigator.of(context).pop();
                        },
                        label: const Text(
                          'Post',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        icon: const Icon(Icons.arrow_upward_rounded),
                      ),
                    ),
                  ),
                  /*Center(
                    child: Container(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      width: 200,
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                            // Foreground color
                            // backgroundColor: AppColors.accentColorDark,
                            foregroundColor: AppColors.accentColorDark,
                            side: const BorderSide(
                                color: AppColors.accentColorDark)),
                        onPressed: () {},
                        label: const Text(
                          'Cancel',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        icon: const Icon(Icons.close),
                      ),
                    ),
                  ),*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
