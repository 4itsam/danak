import 'package:carousel_slider/carousel_slider.dart';
import 'package:danak/gen/assets.gen.dart';
import 'package:danak/models/tips.dart';
import 'package:danak/pages/facts.dart';
import 'package:danak/pages/life_history.dart';
import 'package:danak/pages/menu.dart';
import 'package:danak/pages/text_page.dart';
import 'package:danak/pages/theory.dart';
import 'package:danak/theme.dart';
import 'package:danak/ui/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  List<Tips> tips = [];
  void getTips() {
    tips = Tips.getTips();
  }

  @override
  Widget build(BuildContext context) {
    getTips();
    return Scaffold(
      backgroundColor: scaffoldBackground,
      appBar: AppBar(
        centerTitle: true,
        title: SvgPicture.asset(
          Assets.images.danakColor,
          height: 40,
          width: 40,
        ),
        leading: IconButton(
          onPressed: () {
            Get.to(
              () => Menu(),
              transition: Transition.size,
              duration: Duration(seconds: 1),
            );
          },
          icon: SvgPicture.asset(Assets.images.menu),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: AnimationLimiter(
            child: Column(
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(seconds: 1),
                childAnimationBuilder: (widget) => SlideAnimation(
                  duration: Duration(seconds: 1),
                  delay: Duration(milliseconds: 300),

                  child: FadeInAnimation(child: widget),
                ),
                children: [
                  banner(),
                  bottomSection(),
                  slider(),
                  SizedBox(height: 20),
                  socialIcons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding slider() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: tipBoxStyle,
        child: CarouselSlider.builder(
          itemCount: tips.length,
          itemBuilder: (context, index, realIndex) {
            return Center(
              child: Text(
                textAlign: TextAlign.center,
                tips[index].tips,
                style: bannerTextStyle,
              ),
            );
          },
          options: CarouselOptions(
            autoPlayAnimationDuration: Duration(seconds: 3),

            animateToClosest: true,
            autoPlay: true,
            initialPage: 0,
            scrollPhysics: BouncingScrollPhysics(),
          ),
        ),
      ),
    );
  }

  Container betaBanner() {
    return Container(
      margin: EdgeInsets.only(right: 20, left: 20, top: 30),
      height: 120,
      width: double.infinity,
      decoration: decorationBoxStyle,
      child: Stack(
        children: [
          Positioned(
            top: 30,
            right: 20,
            child: Text.rich(
              TextSpan(
                text: betaTitle,
                style: bannerTextStyle,
                children: <TextSpan>[
                  TextSpan(text: betaSubTitle, style: bannersubTextStyle),
                ],
              ),
            ),
          ),
          Positioned(
            left: 30,
            top: 25,
            child: SvgPicture.asset(Assets.images.danakWhite),
          ),
        ],
      ),
    );
  }

  Column bottomSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 25, bottom: 10),
          child: Text(RowSection.TextTitle, style: rowSectionTitle),
        ),
        SizedBox(
          height: 190,
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                color: primaryColor,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, right: 10, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    rowContainerGen(
                      image: Assets.images.theory,
                      text: RowSection.TextTheory,
                      onTap: () => Get.to(
                        () => Theory(),
                        transition: Transition.fadeIn,
                        duration: Duration(milliseconds: 200),
                      ),
                    ),
                    rowContainerGen(
                      image: Assets.images.life,
                      text: RowSection.TextHistoryLife,
                      onTap: () => Get.to(
                        () => LifeHistory(),
                        transition: Transition.fadeIn,
                        duration: Duration(milliseconds: 200),
                      ),
                    ),
                    rowContainerGen(
                      image: Assets.images.fact,
                      text: RowSection.TextFacts,
                      onTap: () => Get.to(
                        () => Facts(),
                        transition: Transition.fadeIn,
                        duration: Duration(milliseconds: 200),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  GestureDetector rowContainerGen({
    required String image,
    required String text,
    required onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: rowBoxDecoration,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(image),
            ),
          ),
          SizedBox(height: 12),
          Text(text, style: rowSectionTitle),
        ],
      ),
    );
  }

  Padding banner() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Get.to(
            () => TextPage(),
            arguments: [usbTitle, usbDescription],
            transition: Transition.fadeIn,
            duration: Duration(milliseconds: 200),
          );
        },
        child: Container(
          height: 180,
          width: double.infinity,
          decoration: bannerDecoration,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 25,
                      width: 80,
                      decoration: BoxDecoration(
                        color: cardBackground,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Text(
                          BannerText.AuthorText,
                          style: bannerAuthorStyle,
                        ),
                      ),
                    ),
                    Container(
                      height: 25,
                      width: 25,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: cardBackground,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(Assets.images.fire.path),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 30,
                right: 15,
                child: Text.rich(
                  TextSpan(
                    text: BannerText.BannerTitle,
                    style: bannerTextStyle,
                    children: <TextSpan>[
                      TextSpan(
                        text: "\n${BannerText.BannerSubTitle}",
                        style: bannersubTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
