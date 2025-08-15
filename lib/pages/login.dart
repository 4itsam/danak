import 'package:danak/components/components.dart';
import 'package:danak/gen/assets.gen.dart';
import 'package:danak/gen/fonts.gen.dart';
import 'package:danak/pages/main_screen.dart';
import 'package:danak/pages/text_page.dart';
import 'package:danak/theme/text.dart';
import 'package:danak/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hive_ce/hive.dart';

// ignore: must_be_immutable
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _majorController = TextEditingController();

  String selectGender = '';
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
                        textFieldGen(
                          controller: _nameController,
                          text: LoginText.loginNameExample,
                          autofocus: true,
                          textInputAction: TextInputAction.next,
                          maxLength: 25,
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
                        textFieldGen(
                          controller: _majorController,
                          text: LoginText.loginMajorExample,
                          autofocus: true,
                          textInputAction: TextInputAction.next,
                          maxLength: 31,
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
                            style: elevatedButtonTheme,
                            onPressed: () {
                              final String name = _nameController.text;
                              final String major = _majorController.text;
                              final String sex = selectGender;

                              if (name.isEmpty || major.isEmpty || sex == '') {
                                errorLoginWidget();
                                _nameController.clear();
                                _majorController.clear();
                              } else {
                                box.put("name", name);
                                box.put("major", major);
                                box.put("sex", sex);
                                _nameController.clear();
                                _majorController.clear();
                                Get.offAll(() => const MainScreen());
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
              splashRadius: 30,
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
              splashRadius: 30,
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

  SnackbarController errorLoginWidget() {
    return Get.snackbar(
      "",
      "",

      snackStyle: SnackStyle.FLOATING,
      backgroundColor: errorColor,
      colorText: Colors.white,
      titleText: Text("خطا در ورود", style: snackBarTextStyle),
      messageText: Text(
        "لطفا تمامی فیلد های خواسته شده رو پر کنید",
        style: snackBarSubTextStyle,
      ),
      dismissDirection: DismissDirection.horizontal,

      isDismissible: false,
      shouldIconPulse: false,
      duration: const Duration(seconds: 3),
      barBlur: 50,
      icon: const Icon(Icons.error, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
