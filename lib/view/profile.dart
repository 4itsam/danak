import 'package:danak/components/components.dart';
import 'package:danak/gen/assets.gen.dart';
import 'package:danak/view/login.dart';
import 'package:danak/theme/app_strings.dart';
import 'package:danak/theme/colors.dart';
import 'package:danak/theme/theme.dart';
import 'package:danak/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

// ignore: must_be_immutable
class Profile extends StatelessWidget {
  Profile({super.key});
  //! initalize Box
  var box = Hive.box("userInformation");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SolidColors.scaffoldBackground,
      body: SafeArea(
        //! Change Values in every Change
        child: ValueListenableBuilder(
          valueListenable: box.listenable(),
          builder: (BuildContext context, Box box, _) {
            //! initalize the Values Who Need
            var name = Hive.box("userInformation").get('name');
            var major = Hive.box("userInformation").get('major');
            var sex = Hive.box("userInformation").get('sex');
            return CustomScrollView(
              slivers: [
                //*Containes Profile Image, Name & Major
                sliverProfileSection(name, major, sex, box),
                sliverBanner()
              ],
            );
          },
        ),
      ),
    );
  }

  SliverToBoxAdapter sliverBanner() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: bannerRate(),
      ),
    );
  }

  SliverResizingHeader bottonFooter() {
    return SliverResizingHeader(
      child: Padding(
        padding: EdgeInsets.only(top: 50.h),
        child: SizedBox(height: 20.h, width: 100.w),
      ),
    );
  }

  SliverAppBar sliverProfileSection(name, major, sex, Box<dynamic> box) {
    return SliverAppBar(
      backgroundColor: SolidColors.scaffoldBackground,
      flexibleSpace: profileSection(name, major, sex),
      useDefaultSemanticsOrder: true,
      actionsPadding: EdgeInsets.only(top: 180.h, left: 10.w, right: 10.w),
      actions: [
        changeInformationButton(),
        SizedBox(width: 8.w),
        exitButton(box),
      ],
      automaticallyImplyLeading: false,
      centerTitle: false,
      toolbarHeight: 300,
      expandedHeight: 200,
      excludeHeaderSemantics: true,
    );
  }

  Expanded exitButton(Box<dynamic> box) {
    return Expanded(
      child: SizedBox(
        height: 40.h,
        width: double.infinity,
        child: TextButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: SolidColors.primaryColor,
            overlayColor: SolidColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(20.r),
              side: BorderSide.none,
            ),
          ),
          onPressed: () {
            Get.dialog(
              SizedBox(
                height: 100.h,
                width: 100.w,
                child: AlertDialog(
                  alignment: Alignment.bottomCenter,
                  backgroundColor: SolidColors.cardBackground,
                  content: SizedBox(
                    height: 160.h,
                    width: 300.w,
                    child: Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: Column(
                        spacing: 15.h,
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            ProfileText.exitTitleText,
                            style: AppTextStyle.exitDialogTitleStyle,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            ProfileText.exitConditions,
                            style: AppTextStyle.exitDialogSubTitleStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    Column(
                      spacing: 4.w,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: SolidColors.primaryColor,
                            ),
                            onPressed: () {
                              box.deleteAll(["name", "major", "sex"]);
                              Get.offAll(() => SplashScreen());
                            },
                            child: Text(
                              ProfileText.exitText,
                              style: AppTextStyle.exitTextStyle,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: SolidColors.cancelColor,
                            ),
                            onPressed: () {
                              Get.back();
                            },
                            child: Text(
                              ProfileText.cancel,
                              style: AppTextStyle.changeInfoTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          child: Text(ProfileText.exitText, style: AppTextStyle.exitTextStyle),
        ),
      ),
    );
  }

  SizedBox changeInformationButton() {
    return SizedBox(
      height: 40.h,
      width: 240.w,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          overlayColor: SolidColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(20.r),
          ),
        ),
        onPressed: () {
          Get.to(() => const Login(), transition: Transition.cupertinoDialog);
        },
        child: Text(
          ProfileText.changeInformation,
          style: AppTextStyle.changeInfoTextStyle,
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
                style: AppTextStyle.profileTitle,
                children: <TextSpan>[
                  TextSpan(
                    text: '\n$major',
                    style: AppTextStyle.profileSubTitle,
                  ),
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
