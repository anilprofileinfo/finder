import 'package:finder/core/utils/app_colors.dart';
import 'package:finder/core/utils/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of this application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'finder',
      /*theme: ThemeData(
          primarySwatch: Colors
              .deepOrange,fontFamily: 'Play' *//*,scaffoldBackgroundColor: AppColors.scaffoldBackground*//*),*/
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),fontFamily: 'Play',
        useMaterial3: true,
      ),

      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: splashRoute,
    );
  }
}
