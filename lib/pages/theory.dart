import 'package:danak/gen/assets.gen.dart';
import 'package:danak/pages/text_page.dart';
import 'package:danak/ui/theme.dart';
import 'package:danak/ui/text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:danak/models/data.dart';

// ignore: must_be_immutable
class Theory extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  final ScrollBehavior _scrollBehavior = const ScrollBehavior();
  final DragStartBehavior _dragStartBehavior = DragStartBehavior.down;

  Theory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(RowSection.textTheory, style: rowSectionTitle),
      ),
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          dragStartBehavior: _dragStartBehavior,
          scrollBehavior: _scrollBehavior,
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverList.builder(
              itemCount: theoryList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 900),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      duration: const Duration(milliseconds: 900),
                      delay: const Duration(milliseconds: 300),
                      horizontalOffset: 500,
                      child: ScaleAnimation(child: widget),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: InkWell(
                          onTap: () => Get.to(
                            () => TextPage(),
                            arguments: [
                              theoryList[index].title,
                              theoryList[index].text,
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
                                  bottom: 0,
                                  left: 0,
                                  child: SvgPicture.asset(
                                    Assets.images.theoryMountain,
                                  ),
                                ),
                                Positioned(
                                  top: 40.r,
                                  right: 30.r,
                                  child: Text(
                                    theoryList[index].title,
                                    style: theoryBannerStyle,
                                  ),
                                ),
                                Positioned(
                                  bottom: 40.r,
                                  right: 25.r,
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                        6,
                                        2,
                                        6,
                                        2,
                                      ),
                                      child: Text(
                                        theoryList[index].author,
                                        style: theoryBannerSubStyle,
                                      ),
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
