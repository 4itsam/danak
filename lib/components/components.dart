import 'package:danak/theme/colors.dart';
import 'package:danak/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

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

TextField textFieldGen({
  required controller,
  required text,
  required bool autofocus,
  required textInputAction,
  required maxLength,
}) {
  return TextField(
    selectionControls: EmptyTextSelectionControls(),
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
        borderSide: const BorderSide(),
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
