import 'package:carousel_slider/carousel_slider.dart';
import 'package:danak/gen/assets.gen.dart';
import 'package:danak/models/banner_models.dart';
import 'package:danak/models/tips.dart';
import 'package:danak/pages/facts.dart';
import 'package:danak/pages/life_history.dart';
import 'package:danak/pages/menu.dart';
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

  List<BannerModels> bannerModels = [];
  void getBannerModels() {
    bannerModels = BannerModels.getBannerModels();
  }

  @override
  Widget build(BuildContext context) {
    getTips();
    getBannerModels();
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

  CarouselSlider banner() {
    return CarouselSlider.builder(
      itemBuilder: (context, index, realIndex) {
        return GestureDetector(
          onTap: bannerModels[index].onTap,
          child: Card(
            color: primaryColor,
            margin: EdgeInsets.only(top: 20, bottom: 20),
            elevation: 4,
            shadowColor: shadowColor,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(20),
            ),
            child: Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: borderColor,
                  width: 5,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(bannerModels[index].image),
                ),
                boxShadow: [
                  BoxShadow(
                    color: shadowColor,
                    offset: Offset(0, 4),
                    blurRadius: 8,
                    spreadRadius: 0.7,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    right: 10,
                    left: 20,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                          child: SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 4,
                                bottom: 4,
                                right: 8,
                                left: 8,
                              ),
                              child: Text(
                                BannerText.AuthorText,
                                style: bannerAuthorStyle,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              scale: 1.25,
                              image: AssetImage(Assets.images.fire.path),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 25,
                    right: 15,
                    child: Text.rich(
                      TextSpan(
                        text: bannerModels[index].title,
                        style: bannerTextStyle,
                        children: <TextSpan>[
                          TextSpan(
                            text: '\n${bannerModels[index].subTitle}',
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
      },
      itemCount: bannerModels.length,
      options: CarouselOptions(
        scrollPhysics: BouncingScrollPhysics(
          decelerationRate: ScrollDecelerationRate.normal,
        ),
        enableInfiniteScroll: false,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        autoPlayCurve: Curves.ease,
        autoPlay: true,
        animateToClosest: true,

        autoPlayAnimationDuration: Duration(seconds: 3),

        initialPage: 0,

        enlargeFactor: 1,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        disableCenter: false,
        enlargeCenterPage: false,
        viewportFraction: 0.9,
      ),
    );
  }
}
