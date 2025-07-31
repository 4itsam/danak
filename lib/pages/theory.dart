import 'package:danak/gen/assets.gen.dart';
import 'package:danak/models/theory_models.dart';
import 'package:danak/pages/text_page.dart';
import 'package:danak/theme.dart';
import 'package:danak/ui/text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Theory extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  final ScrollBehavior _scrollBehavior = const ScrollBehavior();
  final DragStartBehavior _dragStartBehavior = DragStartBehavior.down;

  List<TheoryModels> theoryModels = [];

  Theory({super.key});
  void getTheoryModels() {
    theoryModels = TheoryModels.getTheoryModels();
  }

  @override
  Widget build(BuildContext context) {
    getTheoryModels();
    return Scaffold(
      backgroundColor: scaffoldBackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(RowSection.TextTheory, style: rowSectionTitle),
      ),
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          dragStartBehavior: _dragStartBehavior,
          scrollBehavior: _scrollBehavior,
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverList.builder(
              itemCount: theoryModels.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: InkWell(
                    onTap: () => Get.to(
                      () => TextPage(),
                      arguments: [
                        theoryModels[index].title,
                        theoryModels[index].text,
                      ],
                      transition: Transition.fadeIn,
                      duration: const Duration(milliseconds: 200),
                    ),
                    child: Container(
                      height: 180,
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
                            top: 40,
                            right: 30,
                            child: Text(
                              theoryModels[index].title,
                              style: theoryBannerStyle,
                            ),
                          ),
                          Positioned(
                            bottom: 40,
                            right: 25,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(6, 2, 6, 2),
                                child: Text(
                                  theoryModels[index].author,
                                  style: theoryBannerSubStyle,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
