import 'package:danak/components/app_bar.dart';
import 'package:danak/gen/assets.gen.dart';
import 'package:danak/theme/app_strings.dart';
import 'package:danak/theme/colors.dart';
import 'package:danak/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SolidColors.scaffoldBackground,
      appBar: myAppBar(text: "توسعه"),
      body: Center(
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.images.working, height: 130.h),
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                text: DevText.emptyPage,
                style: AppTextStyle.aiTextEmptyPage,
                children: <TextSpan>[
                  TextSpan(
                      text: '\n${DevText.betaTitle}',
                      style: AppTextStyle.aiSubTextEmptyPage),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
