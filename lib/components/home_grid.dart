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