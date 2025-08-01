
import 'package:danak/pages/text_page.dart';
import 'package:danak/ui/theme.dart';
import 'package:danak/ui/text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
        title: Text(RowSection.TextFacts, style: rowSectionTitle),
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
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: InkWell(
                    onTap: () => Get.to(
                      () => TextPage(),
                      arguments: [
                        factList[index].title,
                        factList[index].text,
                      ],
                      transition: Transition.fadeIn,
                      duration: const Duration(milliseconds: 200),
                    ),
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      decoration: decorationBoxStyle,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(18),
                            child: Center(
                              child: Text(
                                textAlign: TextAlign.center,
                                factList[index].title,
                                style: theoryBannerStyle,
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
