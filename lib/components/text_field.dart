import 'package:danak/theme/colors.dart';
import 'package:danak/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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