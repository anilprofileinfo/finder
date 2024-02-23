import 'package:finder/core/utils/app_colors.dart';
import 'package:finder/core/utils/app_router.dart';
import 'package:finder/features/home/presentation/page/home.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final _myPage = PageController(initialPage: 0);

  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SizedBox(
          height: 60,
          width: 60,
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () {
              debugPrint('Click');
              Navigator.pushNamed(context, postRoute);
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent, width: 6),
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  begin: Alignment(0.7, -0.5),
                  end: Alignment(0.6, 0.5),
                  colors: [AppColors.primaryColor, AppColors.primaryColor],
                ),
              ),
              child: const Icon(
                Icons.add,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
        bottomNavigationBar: bottomNavigationBar,
        body: PageView(
          controller: _myPage,
          onPageChanged: (index) {
            selectedIndex = index;
          },
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey,
                child: Home(),
              ),
            ),
            Center(
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.blueGrey,
                  child: const Text('Page 2')),
            ),
            Center(
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.brown,
                  child: const Text('Page 3')),
            ),
            Center(
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.blueGrey,
                  child: const Text('Page 4')),
            ),
          ], // Comment this if you need to use Swipe.
        ),
      ),
    );
  }

  Widget get bottomNavigationBar {
    return Container(
        height: 65,
        decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
                color: Colors.transparent, spreadRadius: 0, blurRadius: 4),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomAppBar(
            color: Colors.white,
            surfaceTintColor: Colors.white,
            shape: const CircularNotchedRectangle(),
            //  notchMargin: 3,
            clipBehavior: Clip.antiAlias,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(
                    30,
                  ),
                  topLeft: Radius.circular(
                    30,
                  ),
                ),
              ),
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.home,
                        color: selectedIndex == 0
                            ? AppColors.primaryColor
                            : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _myPage.jumpToPage(0);
                        });
                      }),
                  IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: selectedIndex == 1
                            ? AppColors.primaryColor
                            : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _myPage.jumpToPage(1);
                        });
                      }),
                  const SizedBox(width: 40), // The dummy child
                  IconButton(
                      icon: Icon(
                        Icons.feed,
                        color: selectedIndex == 2
                            ? AppColors.primaryColor
                            : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _myPage.jumpToPage(2);
                        });
                      }),
                  IconButton(
                      icon: Icon(
                        Icons.person,
                        color: selectedIndex == 3
                            ? AppColors.primaryColor
                            : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _myPage.jumpToPage(3);
                        });
                      }),
                ],
              ),
            ),
          ),
        ));
  }
}
