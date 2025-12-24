import 'package:danak/theme/colors.dart';
import 'package:danak/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


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
