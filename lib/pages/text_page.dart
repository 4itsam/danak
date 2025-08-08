import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:danak/ui/theme.dart';
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
      backgroundColor: scaffoldBackground,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),

        slivers: [
          SliverAppBar(
            pinned: false,
            automaticallyImplyLeading: false,
            backgroundColor: primaryColor,
            centerTitle: true,
            expandedHeight: 200,
            collapsedHeight: 70,
            toolbarHeight: 70,
            floating: true,

            flexibleSpace: Align(
              alignment: Alignment.center,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: containerHeadStyle,
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
                    TypewriterAnimatedText(
                      text,
                      textStyle: bodyTextStyle,
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
