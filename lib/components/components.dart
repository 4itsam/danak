import 'package:danak/gen/assets.gen.dart';
import 'package:danak/pages/menu.dart';
import 'package:danak/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

AppBar appBar() {
  return AppBar(
    centerTitle: true,
    title: SvgPicture.asset(Assets.images.danakColor, height: 40, width: 40),
    leading: IconButton(
      onPressed: () {
        Get.to(
          () => const Menu(),
          transition: Transition.size,
          duration: const Duration(seconds: 1),
        );
      },
      icon: SvgPicture.asset(Assets.images.menu),
    ),
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
        const SizedBox(height: 12),
        Text(text, style: rowSectionTitle),
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
    style: fieldedTextStyle,
    controller: controller,
    autofocus: autofocus,
    decoration: InputDecoration(
      hintText: text,
      hintStyle: hintTextStyle,
      fillColor: textFeildBackgroundColor,
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
        borderSide: BorderSide(color: primaryColor, width: 2),
      ),
    ),
  );
}
