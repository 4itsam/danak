import 'package:animations/animations.dart';
import 'package:danak/gen/assets.gen.dart';
import 'package:danak/view/home_screen.dart';
import 'package:danak/view/menu.dart';
import 'package:danak/view/profile.dart';
import 'package:danak/theme/colors.dart';
import 'package:danak/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    //! Navigate Screens
    List<Widget> screens = [const HomeScreen(), Profile()];

    return Scaffold(

      appBar: appBar(),

      //! Navigation Bar & Animation
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 400),
        reverse: selectedIndex == 0,
        transitionBuilder: (child, animation, secondaryAnimation) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: screens[selectedIndex],
      ),

      
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SalomonBottomBar(
          margin: EdgeInsets.symmetric(horizontal: 0.w, vertical: 15),
          selectedColorOpacity: 0.2,

          currentIndex: selectedIndex,
          selectedItemColor: SolidColors.primaryColor,
          unselectedItemColor: SolidColors.unSelectedNavigationBarIndex,
          onTap: (p0) {
            setState(() {
              selectedIndex = p0;
            });
          },
          items: [
            SalomonBottomBarItem(
              selectedColor: SolidColors.primaryColor,
              icon: const FaIcon(FontAwesomeIcons.house, size: 18),
              title: Text(
                "خانه",
                style: AppTextStyle.bottonNavigationTextStyle,
              ),
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.person),
              title: Text(
                "پروفایل",
                style: AppTextStyle.bottonNavigationTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      centerTitle: true,
      title: SvgPicture.asset(
        Assets.images.danakColor,
        height: 40,
        width: 40,
      ),
      leading: IconButton(
        onPressed: () {
          Get.to(
            () => const Menu(),
            transition: Transition.size,
            duration: const Duration(seconds: 1),
          );
        },
        icon: SvgPicture.asset(Assets.images.menu),
      ),
    );
  }
}
