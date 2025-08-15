import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:danak/gen/assets.gen.dart';
import 'package:danak/pages/login.dart';
import 'package:danak/pages/main_screen.dart';
import 'package:danak/theme/theme.dart';
import 'package:danak/theme/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hive_ce/hive.dart';

// ignore: must_be_immutable
class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  var name = Hive.box("userInformation").get('name');
  var major = Hive.box("userInformation").get('major');
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      if (Hive.box("userInformation").isEmpty ||
          major == null ||
          name == null) {
        return Get.off(() => const Login());
      } else {
        Get.off(() => const MainScreen());
      }
    });
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              SvgPicture.asset(Assets.images.danakWhite, width: 80, height: 80),
              const Spacer(flex: 2),
              AnimatedTextKit(
                isRepeatingAnimation: false,

                animatedTexts: [
                  TyperAnimatedText(
                    tipsText,
                    textStyle: splashTips,
                    speed: const Duration(milliseconds: 70),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.images.shakhes.path,
                      width: 40,
                      height: 40,
                    ),
                    const SizedBox(width: 10),
                    SvgPicture.asset(
                      Assets.images.dakto,
                      width: 30,
                      height: 30,
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
