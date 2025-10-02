import 'package:danak/gen/assets.gen.dart';
import 'package:danak/theme/app_strings.dart';
import 'package:danak/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

InkWell bannerRate() {
  return InkWell(
    onTap: () async {
      final Uri rateUri = Uri.parse(
        //Todo
        //change link for each market
        AppLink.myketLink,
      );
      if (await canLaunchUrl(rateUri)) {
        await launchUrl(rateUri, mode: LaunchMode.externalApplication);
      }
    },
    child: Container(
      height: 90.h,
      width: 345.w,
      decoration: AppBoxDecoration.bannerDecorationRate,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text.rich(
            TextSpan(
              text: BannerRate.title,
              style: AppTextStyle.bannerRateTextStyle,
              children: <TextSpan>[
                TextSpan(
                  text: BannerRate.subTitle,
                  style: AppTextStyle.bannerRatesubTextStyle,
                ),
              ],
            ),
          ),
          Image.asset(Assets.images.star.path),
        ],
      ),
    ),
  );
}