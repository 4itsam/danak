import 'package:danak/gen/assets.gen.dart';
import 'package:danak/models/data.dart';
import 'package:danak/pages/login.dart';
import 'package:danak/pages/splash_screen.dart';
import 'package:danak/theme/text.dart';
import 'package:danak/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

// ignore: must_be_immutable
class Profile extends StatelessWidget {
  Profile({super.key});
  var box = Hive.box("userInformation");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackground,
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: box.listenable(),
          builder: (BuildContext context, Box box, _) {
            var name = Hive.box("userInformation").get('name');
            var major = Hive.box("userInformation").get('major');
            var sex = Hive.box("userInformation").get('sex');
            return CustomScrollView(
              slivers: [
                sliverProfileSection(name, major, sex, box),
                // sliverClubText(),
                // sliverGridClub(),
                // bottonFooter(),
              ],
            );
          },
        ),
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

  SliverGrid sliverGridClub() {
    return SliverGrid.builder(
                itemCount: club.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 50,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Container(
                        height: 80.h,
                        width: 80.w,
                        decoration: clubContainerDecoration,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Image.asset(club[index].imageClub),
                        ),
                      ),
                      SizedBox(
                        width: 80.w,
                        height: 30.h,

                        child: Text(
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.visible,
                          club[index].titleClub,
                          style: clubNameTextStyle,
                        ),
                      ),
                    ],
                  );
                },
              );
  }

  SliverAppBar sliverClubText() {
    return SliverAppBar(
                backgroundColor: scaffoldBackground,
                centerTitle: true,
                toolbarHeight: 60,
                collapsedHeight: 60,
                expandedHeight: 30,
                pinned: true,
                floating: true,
                snap: true,

                title: Padding(
                  padding: EdgeInsets.only(top: 16.h),
                  child: Text(clubPartnersText, style: rowSectionTitle),
                ),
              );
  }

  SliverAppBar sliverProfileSection(name, major, sex, Box<dynamic> box) {
    return SliverAppBar(
                backgroundColor: scaffoldBackground,
                flexibleSpace: profileSection(name, major, sex),
                useDefaultSemanticsOrder: true,
                actionsPadding: EdgeInsets.only(
                  top: 180.h,
                  left: 10.w,
                  right: 10.w,
                ),
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
            backgroundColor: primaryColor,
            overlayColor: primaryColor,
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
                  backgroundColor: cardBackground,
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
                            exitTitleText,
                            style: exitDialogTitleStyle,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            exitConditions,
                            style: exitDialogSubTitleStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: primaryColor,
                            ),
                            onPressed: () {
                              box.deleteAll(["name", "major", "sex"]);
                              Get.offAll(() => SplashScreen());
                            },
                            child: Text(exitText, style: exitTextStyle),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: cancelColor,
                            ),
                            onPressed: () {
                              Get.back();
                            },
                            child: Text(cancel, style: changeInfoTextStyle),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          child: Text(exitText, style: exitTextStyle),
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
          overlayColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(20.r),
          ),
        ),
        onPressed: () {
          Get.to(() => const Login(), transition: Transition.cupertinoDialog);
        },
        child: Text(changeInformation, style: changeInfoTextStyle),
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
