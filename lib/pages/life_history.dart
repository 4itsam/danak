import 'package:danak/gen/assets.gen.dart';
import 'package:danak/pages/text_page.dart';
import 'package:danak/theme/theme.dart';
import 'package:danak/theme/text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:danak/models/data.dart';

// ignore: must_be_immutable
class LifeHistory extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  final ScrollBehavior _scrollBehavior = const ScrollBehavior();
  final DragStartBehavior _dragStartBehavior = DragStartBehavior.down;

  LifeHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(RowSection.textHistoryLife, style: rowSectionTitle),
      ),
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          scrollBehavior: _scrollBehavior,
          dragStartBehavior: _dragStartBehavior,
          slivers: [
            SliverList.builder(
              itemCount: lifeList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 900),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      duration: const Duration(milliseconds: 1100),
                      delay: const Duration(milliseconds: 900),
                      verticalOffset: 500,
                      child: ScaleAnimation(child: widget),
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20.r),
                        child: InkWell(
                          onTap: () => Get.to(
                            () => TextPage(),
                            arguments: [
                              lifeList[index].title,
                              lifeList[index].text,
                            ],
                            fullscreenDialog: true,
                            preventDuplicates: true,

                            transition: Transition.size,
                            duration: const Duration(milliseconds: 300),
                          ),
                          child: Container(
                            height: 180.h,
                            width: double.infinity,
                            decoration: decorationBoxStyle,
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: 0.r,
                                  left: 20.r,
                                  child: SvgPicture.asset(
                                    Assets.images.lifeReading,
                                  ),
                                ),
                                Positioned(
                                  top: 50.r,
                                  right: 40.r,
                                  child: Text.rich(
                                    TextSpan(
                                      text: "زندگی نامه",
                                      style: lifeSubStyle,
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: "\n${lifeList[index].title}",
                                          style: lifestyle,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
