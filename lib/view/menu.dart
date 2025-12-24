import 'package:danak/gen/assets.gen.dart';
import 'package:danak/view/text_page.dart';
import 'package:danak/theme/colors.dart';
import 'package:danak/theme/theme.dart';
import 'package:danak/theme/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});
  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverAppBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.vertical(
                bottom: Radius.circular(50.r),
              ),
            ),
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: SolidColors.primaryColor,
            leading: Padding(
              padding: const EdgeInsets.only(top: 24, right: 20),
              child: GestureDetector(
                onTap: () => Get.back(),
                child: const Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    CupertinoIcons.chevron_right,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            toolbarHeight: 310.h,
            title: Column(
              children: [
                SvgPicture.asset(Assets.images.danakWhite, height: 120.h),
              ],
            ),
          ),
          SliverList.list(
            children: [
              SizedBox(height: 42.h),
              Padding(
                padding: EdgeInsets.only(left: 40.w, right: 40.w, bottom: 20.h),
                child: textButton(
                  onTap: () {
                    Get.dialog(
                      transitionCurve: Curves.easeIn,
                      AlertDialog(
                        backgroundColor: SolidColors.primaryColor,
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(Assets.images.developer.path),
                            SizedBox(width: 10.w),
                            Text.rich(
                              TextSpan(
                                text: MenuText.devName,
                                style: AppTextStyle.devTextStyle,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "\n${MenuText.devAbility}",
                                    style: AppTextStyle.devSubTextStyle,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  text: MenuText.dev,
                  icon: Assets.images.devIcon,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 40.w, right: 40.w, bottom: 20.h),
                child: textButton(
                  text: MenuText.github,
                  icon: Assets.images.github,
                  onTap: () async {
                    final Uri githubUri = Uri.parse(AppLink.githubLink);

                    if (await canLaunchUrl(githubUri)) {
                      await launchUrl(
                        githubUri,
                        mode: LaunchMode.externalApplication,
                      );
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 40.w, right: 40.w, bottom: 20.h),
                child: textButton(
                  text: MenuText.rate,
                  icon: Assets.images.rateIcon,
                  onTap: () async {
                    final Uri rateUri = Uri.parse(
                      //Todo
                      //change link for each market
                      AppLink.bazaarLink,
                    );
                    if (await canLaunchUrl(rateUri)) {
                      await launchUrl(
                        rateUri,
                        mode: LaunchMode.externalApplication,
                      );
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 40.w, right: 40.w, bottom: 20.h),
                child: textButton(
                  onTap: () => Get.to(
                    () => TextPage(),
                    arguments: [MenuText.privacy, MenuText.privacyText],
                  ),
                  text: MenuText.privacy,
                  icon: Assets.images.privacyIcon,
                ),
              ),
              SizedBox(height: 10.h),
              socialIcons(SolidColors.socialIconsColorMenu),
              SizedBox(height: 20.h),
              SvgPicture.asset(Assets.images.terms),
            ],
          ),
        ],
      ),
    );
  }

  GestureDetector textButton({
    required String text,
    required String icon,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Container(
        height: 54.h,
        width: double.infinity,
        decoration: AppBoxDecoration.textMenuButtonStyle,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text, style: AppTextStyle.menuTitle),
              SvgPicture.asset(icon),
            ],
          ),
        ),
      ),
    );
  }
}

Row socialIcons(Color color) {
  return Row(
    spacing: 20,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      GestureDetector(
        onTap: () async {
          final Uri daktoUri = Uri.parse('https://t.me/daktoDev');
          if (await canLaunchUrl(daktoUri)) {
            await launchUrl(daktoUri, mode: LaunchMode.externalApplication);
          }
        },
        child: SvgPicture.asset(
          Assets.images.daktoIcon,
          colorFilter: const ColorFilter.linearToSrgbGamma(),
        ),
      ),
      GestureDetector(
        onTap: () async {
          final Uri telegramUrl = Uri.parse('https://t.me/usb_shakhes');
          if (await canLaunchUrl(telegramUrl)) {
            await launchUrl(telegramUrl, mode: LaunchMode.externalApplication);
          }
        },
        child: SvgPicture.asset(
          Assets.images.telegramIcon,
          colorFilter: const ColorFilter.linearToSrgbGamma(),
        ),
      ),
      GestureDetector(
        onTap: () async {
          final Uri instaUrl = Uri.parse('https://instagram.com/shakhes_usb');
          if (await canLaunchUrl(instaUrl)) {
            await launchUrl(instaUrl, mode: LaunchMode.externalApplication);
          }
        },
        child: SvgPicture.asset(
          Assets.images.instaIcon,
          colorFilter: const ColorFilter.linearToSrgbGamma(),
        ),
      ),
    ],
  );
}
