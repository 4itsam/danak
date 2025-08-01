import 'package:danak/gen/assets.gen.dart';
import 'package:danak/pages/text_page.dart';
import 'package:danak/ui/theme.dart';
import 'package:danak/ui/text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:danak/models/data.dart';

// ignore: must_be_immutable
class LifeHistory extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  final ScrollBehavior _scrollBehavior =const ScrollBehavior();
  final DragStartBehavior _dragStartBehavior=DragStartBehavior.down;
 

  LifeHistory({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(RowSection.TextHistoryLife, style: rowSectionTitle),
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
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: InkWell(
                    onTap: () => Get.to(
                      () => TextPage(),
                      arguments: [
                        lifeList[index].title,
                        lifeList[index].text,
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
                            left: 20,
                            child: SvgPicture.asset(Assets.images.lifeReading),
                          ),
                          Positioned(
                            top: 50,
                            right: 40,
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
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
