import 'package:finder/core/utils/app_colors.dart';
import 'package:finder/core/utils/app_text.dart';
import 'package:finder/features/home/presentation/provider/home_provider.dart';
import 'package:finder/features/home/presentation/widgets/stories_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const double appBarBottomCornerRadius = 24.0;
const double leadingIconMargin = 12.0;
const double leadingIconCircleRadius = 48.0;


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //Creating or Initializing Home Provider
      create: (_) => HomeProvider(),
      builder: (context, child) {
        return Consumer<HomeProvider>(
          builder: (context, data, _) {
            return Scaffold(
              backgroundColor: AppColors.scaffoldBackground,
              //Used for scroll AppBar on swipe
              body: NestedScrollView(
                floatHeaderSlivers: true,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) => [
                  //AppBar with slide in out
                  SliverAppBar(
                    //Rounder corner on bottom of the AppBar
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(appBarBottomCornerRadius),
                      ),
                    ),
                    backgroundColor: AppColors.white,
                    //AppBar Profile Icon/Leading Icon
                    leading: Container(
                      margin: const EdgeInsets.all(leadingIconMargin),
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(leadingIconCircleRadius),
                        child: const Image(
                          image: NetworkImage(
                              "https://cdn.pixabay.com/photo/2016/11/14/04/25/umbrella-1822586_1280.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    floating: true,
                    snap: true,
                    //AppBar title
                    title: const Text(appName),
                    actions: <Widget>[
                      //AppBar search button
                      IconButton(
                          icon: const Icon(Icons.search_rounded),
                          onPressed: () {}),
                    ],
                  )
                ],
                //Stories List
                body: const StoriesList(),
              ),
            );
          },
        );
      },
    );
  }
}
