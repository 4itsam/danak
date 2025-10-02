import 'package:danak/theme/colors.dart';
import 'package:danak/theme/theme.dart';
import 'package:flutter/material.dart';

AppBar myAppBar({required String text}) {
  return AppBar(
    backgroundColor: SolidColors.appBarBackground,
    automaticallyImplyLeading: false,
    title: Text(text, style: AppTextStyle.rowSectionTitle),
  );
}