import 'package:danak/gen/assets.gen.dart';
import 'package:danak/pages/text_page.dart';
import 'package:danak/theme.dart';
import 'package:danak/ui/text.dart';
import 'package:flutter/material.dart';
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
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.vertical(
                bottom: Radius.circular(50),
              ),
            ),
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: primaryColor,
            toolbarHeight: 310,
            title: Column(
              children: [
                Image.asset(Assets.images.danakBig.path),
                Text(menuAppbarText, style: menuTitle),
              ],
            ),
          ),
          SliverList.list(
            children: [
              const SizedBox(height: 42),

              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
                child: textButton(
                  onTap: () {
                    Get.dialog(
                      transitionCurve: Curves.easeIn,
                      AlertDialog(
                        backgroundColor: primaryColor,
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(Assets.images.developer.path),
                            const SizedBox(width: 10),
                            Text.rich(
                              TextSpan(
                                text: devName,
                                style: devTextStyle,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "\n$devAbility",
                                    style: devSubTextStyle,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  text: dev,
                  icon: Assets.images.devIcon,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
                child: textButton(
                  text: github,
                  icon: Assets.images.github,
                  onTap: () async {
                    final Uri githubUri = Uri.parse(
                      "https://github.com/4itsam/danak",
                    );
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
                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
                child: textButton(
                  text: rate,
                  icon: Assets.images.rateIcon,
                  onTap: () async {
                    final Uri rateUri = Uri.parse(
                      //! To do 
                      //change link for each market
                      "https://cafebazaar.ir/app/com.danak.da",
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
                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
                child: textButton(
                  onTap: () => Get.to(
                    () => TextPage(),
                    arguments: [privacy, privacyText],
                  ),
                  text: privacy,
                  icon: Assets.images.privacyIcon,
                ),
              ),
              const SizedBox(height: 20),
              socialIcons(),
              const SizedBox(height: 20),
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
        height: 54,
        width: double.infinity,
        decoration: textMenuButtonStyle,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text, style: menuTitle),
              SvgPicture.asset(icon),
            ],
          ),
        ),
      ),
    );
  }
}

Row socialIcons() {
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
        child: SvgPicture.asset(Assets.images.daktoIcon),
      ),
      GestureDetector(
        onTap: () async {
          final Uri telegramUrl = Uri.parse('https://t.me/usb_shakhes');
          if (await canLaunchUrl(telegramUrl)) {
            await launchUrl(telegramUrl, mode: LaunchMode.externalApplication);
          }
        },
        child: SvgPicture.asset(Assets.images.telegramIcon),
      ),

      GestureDetector(
        onTap: () async {
          final Uri instaUrl = Uri.parse('https://instagram.com/shakhes_usb');
          if (await canLaunchUrl(instaUrl)) {
            await launchUrl(instaUrl, mode: LaunchMode.externalApplication);
          }
        },
        child: SvgPicture.asset(Assets.images.instaIcon),
      ),
    ],
  );
}
