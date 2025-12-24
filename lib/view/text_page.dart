import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:danak/theme/colors.dart';
import 'package:danak/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class TextPage extends StatelessWidget {
  String title = Get.arguments[0];
  String text = Get.arguments[1];

  TextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SolidColors.scaffoldBackground,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            pinned: true,
            excludeHeaderSemantics: true,
            forceElevated: true,
            automaticallyImplyLeading: true,
            leading: GestureDetector(
              onTap: () => Get.back(),
              child: const Icon(
                CupertinoIcons.chevron_right,
                color: Colors.white,
              ),
            ),
            backgroundColor: SolidColors.primaryColor,
            centerTitle: true,
            expandedHeight: 200,
            collapsedHeight: 70,
            toolbarHeight: 70,
            floating: true,
            stretch: true,
            flexibleSpace: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.containerHeadStyle,
                ),
              ),
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.vertical(
                bottom: Radius.circular(30),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(14),
                child: AnimatedTextKit(
                  isRepeatingAnimation: false,
                  repeatForever: false,
                  totalRepeatCount: 0,
                  displayFullTextOnTap: true,
                  animatedTexts: [
                    TyperAnimatedText(
                      text,
                      textStyle: AppTextStyle.bodyTextStyle,
                      speed: const Duration(milliseconds: 20),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
