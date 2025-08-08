import 'package:danak/gen/assets.gen.dart';
import 'package:danak/pages/login.dart';
import 'package:danak/ui/text.dart';
import 'package:danak/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

// ignore: must_be_immutable
class Profile extends StatelessWidget {
  Profile({super.key});
  var box = Hive.box("userInformation");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ValueListenableBuilder(
            valueListenable: box.listenable(),
            builder: (BuildContext context, Box box, _) {
              var name = Hive.box("userInformation").get('name');
              var major = Hive.box("userInformation").get('major');
              var sex = Hive.box("userInformation").get('sex');
              return SingleChildScrollView(
                child: AnimationLimiter(
                  child: Column(
                    children: AnimationConfiguration.toStaggeredList(
                      duration: const Duration(milliseconds: 900),
                      childAnimationBuilder: (widget) => SlideAnimation(
                        duration: const Duration(milliseconds: 900),
                        delay: const Duration(milliseconds: 200),
                        child: FadeInAnimation(child: widget),
                      ),

                      children: [
                        profileSection(name, major, sex),

                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            overlayColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(20.r),
                            ),
                          ),
                          onPressed: () {
                            Get.off(
                              () => Login(),
                              transition: Transition.cupertinoDialog,
                            );
                          },
                          child: Text(
                            changeInformation,
                            style: changeInfoTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Padding profileSection(name, major, sex) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 80.h,
              width: 80.w,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: imageGender(sex),
            ),

            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                text: name,
                style: profileTitle,
                children: <TextSpan>[
                  TextSpan(text: '\n$major', style: profileSubTitle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Image imageGender(sex) {
    if (sex == "male") {
      return Image.asset(Assets.images.maleIcon.path);
    } else {
      return Image.asset(Assets.images.femailIcon.path);
    }
  }
}
