import 'package:danak/theme/colors.dart';
import 'package:danak/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

AppBar myAppBar({required String text}) {
  return AppBar(
    backgroundColor: SolidColors.appBarBackground,
    leading: GestureDetector(
      onTap: () => Get.back(),
      child:
          Icon(CupertinoIcons.chevron_right, color: SolidColors.textBlackTitle),
    ),
    automaticallyImplyLeading: true,
    title: Text(text, style: AppTextStyle.rowSectionTitle),
  );
}
