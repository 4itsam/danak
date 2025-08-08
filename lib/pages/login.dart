import 'package:danak/gen/assets.gen.dart';
import 'package:danak/gen/fonts.gen.dart';
import 'package:danak/pages/main_screen.dart';
import 'package:danak/pages/text_page.dart';
import 'package:danak/ui/text.dart';
import 'package:danak/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hive_ce/hive.dart';

// ignore: must_be_immutable
class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _majorController = TextEditingController();

  String selectGender = 'male';
  var box = Hive.box("userInformation");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackground,

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: EdgeInsets.all(30.r),
                    child: Column(
                      children: [
                        appBarTitle(),
                        SizedBox(height: 50.h),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            LoginText.loginName,
                            style: textFeildText,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        textFeildGen(
                          controller: _nameController,
                          text: LoginText.loginNameExample,
                          autofocus: true,
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(height: 30.h),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            LoginText.loginMajor,
                            style: textFeildText,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        textFeildGen(
                          controller: _majorController,
                          text: LoginText.loginMajorExample,
                          autofocus: true,
                          textInputAction: TextInputAction.done,
                        ),
                        SizedBox(height: 30.h),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(LoginText.loginSex, style: textFeildText),
                        ),
                        
                        genderBoolBox(),
                        // SizedBox(height: size.height / 4),
                        const Spacer(flex: 2),

                        SvgPicture.asset(Assets.images.terms),
                        SizedBox(height: 20.h),
                        SizedBox(
                          width: 250.w,
                          child: GestureDetector(
                            onTap: () => Get.to(
                              () => TextPage(),
                              arguments: [privacy, privacyText],
                              transition: Transition.fade,
                            ),
                            child: Text.rich(
                              textAlign: TextAlign.center,
                              TextSpan(
                                text: "با ورود به برنامه با ",
                                style: termsNormalStyle,
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        "قوانین استفاده از اپلیکیشن و حریم خصوصی ",
                                    style: termsBoldStyle,
                                  ),
                                  const TextSpan(text: "موافقت می کنید"),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,

                              overlayColor: Colors.white60,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(
                                  15.r,
                                ),
                                side: const BorderSide(
                                  color: Colors.white,
                                  width: 1.5,
                                  style: BorderStyle.solid,
                                ),
                              ),
                            ),
                            onPressed: () {
                              final String name = _nameController.text;
                              final String major = _majorController.text;
                              final String sex = selectGender;

                              if (name.isEmpty || major.isEmpty) {
                                return;
                              } else {
                                box.put("name", name);
                                box.put("major", major);
                                box.put("sex", sex);
                                Get.off(() => const MainScreen());
                              }
                            },
                            child: Text(
                              LoginText.loginBotton,
                              style: loginBottonActionStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Row genderBoolBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(
              'آقا',
              style: TextStyle(
                fontSize: 16,
                fontFamily: FontFamily.iranYekan,
                color: subTextBlackTitle,
              ),
            ),
            Radio<String>(
              fillColor: WidgetStatePropertyAll(primaryColor),
              value: 'male',
              groupValue: selectGender,
              onChanged: (value) {
                setState(() {
                  selectGender = "male";
                });
              },
            ),
          ],
        ),
        SizedBox(width: 40.w),
        Row(
          children: [
            Text(
              "خانم",
              style: TextStyle(
                fontSize: 16,
                fontFamily: FontFamily.iranYekan,
                color: subTextBlackTitle,
              ),
            ),
            Radio<String>(
              fillColor: WidgetStatePropertyAll(primaryColor),
              value: 'female',
              groupValue: selectGender,
              onChanged: (value) {
                setState(() {
                  selectGender = 'female';
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  TextField textFeildGen({
    required controller,
    required text,
    required bool autofocus,
    required textInputAction,
  }) {
    return TextField(
      canRequestFocus: true,
      textInputAction: textInputAction,
      style: fieldedTextStyle,
      controller: controller,
      autofocus: autofocus,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: hintTextStyle,
        fillColor: textFeildBackgroundColor,
        filled: true,
        alignLabelWithHint: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.white, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: primaryColor, width: 2),
        ),
      ),
    );
  }

  Align appBarTitle() {
    return Align(
      alignment: Alignment.topRight,
      child: Text.rich(
        TextSpan(
          text: LoginText.appBarText,
          style: appBarLoginTitleStyle,
          children: <TextSpan>[
            TextSpan(
              text: '\n${LoginText.appBarSubText}',
              style: appBarLoginSubTitleStyle,
            ),
          ],
        ),
      ),
    );
  }
}
