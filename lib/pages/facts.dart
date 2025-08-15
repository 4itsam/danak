import 'package:danak/gen/assets.gen.dart';
import 'package:danak/pages/text_page.dart';
import 'package:danak/theme/theme.dart';
import 'package:danak/theme/text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:danak/models/data.dart';

class Facts extends StatefulWidget {
  const Facts({super.key});
  @override
  State<Facts> createState() => _FactsState();
}

class _FactsState extends State<Facts> {
  final ScrollController _scrollController = ScrollController();
  final ScrollBehavior _scrollBehavior = const ScrollBehavior();
  final DragStartBehavior _dragStartBehavior = DragStartBehavior.down;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(RowSection.textFacts, style: rowSectionTitle),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          dragStartBehavior: _dragStartBehavior,
          scrollBehavior: _scrollBehavior,

          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverList.builder(
              itemCount: factList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 900),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      duration: const Duration(milliseconds: 1100),
                      delay: const Duration(milliseconds: 900),
                      horizontalOffset: -500,
                      verticalOffset: 200,
                      child: ScaleAnimation(child: widget),
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20.r),
                        child: InkWell(
                          onTap: () => Get.to(
                            () => TextPage(),
                            arguments: [
                              factList[index].title,
                              factList[index].text,
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
                                  top: 40.r,
                                  right: 20.r,
                                  child: SizedBox(
                                    width: 200.w,
                                    child: Text(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                      textAlign: TextAlign.start,
                                      factList[index].title,
                                      style: theoryBannerStyle,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 10.r,
                                  left: 30.r,
                                  child: SvgPicture.asset(
                                    Assets.images.factSection,
                                    height: 130.h,
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
