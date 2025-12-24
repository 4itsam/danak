import 'package:carousel_slider/carousel_slider.dart';
import 'package:danak/components/banner.dart';
import 'package:danak/components/home_grid.dart';
import 'package:danak/gen/assets.gen.dart';
import 'package:danak/theme/colors.dart';
import 'package:danak/theme/theme.dart';
import 'package:danak/theme/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:danak/data/data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SolidColors.scaffoldBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [banner(bannerList), bottomSection(), bannerRate()],
          ),
        ),
      ),
    );
  }

  Column bottomSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 360.h,
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                height: 90.h,
                width: double.infinity,
                decoration: BoxDecoration(color: SolidColors.primaryColor),
                child: SvgPicture.asset(
                  Assets.images.pattern,
                  fit: BoxFit.cover,
                  colorFilter: const ColorFilter.mode(
                    Color.fromARGB(97, 255, 255, 255),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.r),
                //! Apps Grid
                child: GridView.builder(
                  padding: EdgeInsets.only(top: 24.h),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: abilityFeild.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    return rowContainerGen(
                      image: abilityFeild[index].image,
                      text: abilityFeild[index].text,
                      onTap: abilityFeild[index].onTap,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  CarouselSlider banner(bannerList) {
    return CarouselSlider.builder(
      itemBuilder: (context, index, realIndex) {
        return GestureDetector(
          onTap: bannerList[index].onTap,
          child: Card(
            color: SolidColors.primaryColor,
            margin: const EdgeInsets.only(top: 20, bottom: 20),
            elevation: 4,
            shadowColor: SolidColors.shadowColor,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(20.r),
            ),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: SolidColors.borderColor,
                  width: 5,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(20.r),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(bannerList[index].image),
                ),
                boxShadow: [
                  BoxShadow(
                    color: SolidColors.shadowColor,
                    offset: const Offset(0, 4),
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
                                BannerText.authorText,
                                style: AppTextStyle.bannerAuthorStyle,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 20.h,
                          width: 20.w,
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
                        text: bannerList[index].title,
                        style: AppTextStyle.bannerTextStyle,
                        children: <TextSpan>[
                          TextSpan(
                            text: '\n${bannerList[index].subTitle}',
                            style: AppTextStyle.bannersubTextStyle,
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
      //! SlideShow Options

      itemCount: bannerList.length,

      options: CarouselOptions(
          disableCenter: false,
          height: 220.h,
          enlargeStrategy: CenterPageEnlargeStrategy.scale,
          enlargeFactor: 0.35,
          initialPage: 0,
          viewportFraction: 0.9,
          enableInfiniteScroll: false,
          autoPlay: true,
          enlargeCenterPage: true,
          autoPlayCurve: Curves.linearToEaseOut,
          autoPlayAnimationDuration: const Duration(seconds: 1),
          animateToClosest: false,
          pauseAutoPlayOnManualNavigate: true,
          scrollPhysics: const BouncingScrollPhysics()),
    );
  }
}
