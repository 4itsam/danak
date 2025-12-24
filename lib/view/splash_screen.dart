import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:danak/gen/assets.gen.dart';
import 'package:danak/view/login.dart';
import 'package:danak/view/main_screen.dart';
import 'package:danak/theme/colors.dart';
import 'package:danak/theme/theme.dart';
import 'package:danak/theme/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hive_ce/hive.dart';

// ignore: must_be_immutable
class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  // Get Box values
  var name = Hive.box("userInformation").get('name');
  var major = Hive.box("userInformation").get('major');

  @override
  Widget build(BuildContext context) {
    //! Check If User Login
    Future.delayed(const Duration(seconds: 3), () {
      if (Hive.box("userInformation").isEmpty ||
          major == null ||
          name == null) {
        return Get.off(() => const Login());
      } else {
        Get.off(() => const MainScreen());
      }
    });
    return Scaffold(
      backgroundColor: SolidColors.primaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              //? Danak Logo
              SvgPicture.asset(Assets.images.danakWhite, width: 80, height: 80),
              const Spacer(flex: 2),

              //? Animated Hint Text
              AnimatedTextKit(
                isRepeatingAnimation: false,
                animatedTexts: [
                  TyperAnimatedText(
                    tipsText,
                    textStyle: AppTextStyle.splashTips,
                    speed: const Duration(milliseconds: 70),
                  ),
                ],
              ),

              //? Logos
              // Padding(
              //   padding: const EdgeInsets.all(12),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Image.asset(
              //         Assets.images.shakhes.path,
              //         width: 40,
              //         height: 40,
              //       ),
              //       const SizedBox(width: 10),
              //       SvgPicture.asset(
              //         Assets.images.dakto,
              //         width: 30,
              //         height: 30,
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(height: 12.h,),
              SpinKitThreeBounce(
                color: SolidColors.loadingColor,
                size: 28,
              ),
              const SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }
}
