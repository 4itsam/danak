import 'package:danak/gen/assets.gen.dart';
import 'package:danak/pages/main_screen.dart';
import 'package:danak/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Get.off(
        () => MainScreen(),
        transition: Transition.fade,
        duration: Duration(seconds: 1),
      );
    });
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 2),
              SvgPicture.asset(
                Assets.images.danakWhite,
                width: 100,
                height: 100,
              ),
              Spacer(flex: 2),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.images.shakhes.path,
                      width: 50,
                      height: 50,
                    ),
                    SizedBox(width: 10),
                    SvgPicture.asset(
                      Assets.images.dakto,
                      width: 40,
                      height: 40,
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
