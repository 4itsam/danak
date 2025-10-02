import 'package:danak/gen/assets.gen.dart';
import 'package:danak/theme/app_strings.dart';
import 'package:danak/theme/colors.dart';
import 'package:danak/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

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
          height: 90.h,
          width: 90.w,
          decoration: AppBoxDecoration.rowBoxDecoration,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(image),
          ),
        ),
        const SizedBox(height: 12),
        Text(text, style: AppTextStyle.rowSectionTitle),
      ],
    ),
  );
}

TextField textFieldGen(
    {required controller,
    required text,
    required bool autofocus,
    required textInputAction,
    required maxLength,
    maxLine}) {
  return TextField(
    maxLines: maxLine,
    maxLengthEnforcement: MaxLengthEnforcement.enforced,
    keyboardAppearance: Brightness.dark,
    maxLength: maxLength,
    canRequestFocus: true,
    textInputAction: textInputAction,
    style: AppTextStyle.fieldedTextStyle,
    controller: controller,
    autofocus: autofocus,
    decoration: InputDecoration(
      hintText: text,
      hintStyle: AppTextStyle.hintTextStyle,
      fillColor: SolidColors.textFeildBackgroundColor,
      filled: true,
      alignLabelWithHint: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.white),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.white, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(color: SolidColors.primaryColor, width: 2),
      ),
    ),
  );
}

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

AppBar myAppBar({required String text}) {
  return AppBar(
    backgroundColor: SolidColors.appBarBackground,
    automaticallyImplyLeading: false,
    title: Text(text, style: AppTextStyle.rowSectionTitle),
  );
}

SnackbarController errorLoginWidget() {
  return Get.snackbar(
    "",
    "",
    snackStyle: SnackStyle.FLOATING,
    backgroundColor: SolidColors.errorColor,
    colorText: Colors.white,
    titleText:
        Text("خطا در ورود اطلاعات", style: AppTextStyle.snackBarTextStyle),
    messageText: Text(
      "لطفا تمامی فیلد های خواسته شده رو پر کنید",
      style: AppTextStyle.snackBarSubTextStyle,
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
