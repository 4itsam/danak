import 'package:danak/gen/assets.gen.dart';
import 'package:danak/models/life_history_models.dart';
import 'package:danak/pages/text_page.dart';
import 'package:danak/theme.dart';
import 'package:danak/ui/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class LifeHistory extends StatelessWidget {
  List<LifeHistoryModel> lifeHistory = [];

  LifeHistory({super.key});
  void getLifeHistory() {
    lifeHistory = LifeHistoryModel.getLifeHistory();
  }

  @override
  Widget build(BuildContext context) {
    getLifeHistory();
    return Scaffold(
      appBar: AppBar(
         automaticallyImplyLeading: false
        ,title: Text(RowSection.TextHistoryLife,style: rowSectionTitle,),),
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverList.builder(
              itemCount: lifeHistory.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: InkWell(
                    onTap: () => Get.to(
                      () => TextPage(),
                      arguments: [
                        lifeHistory[index].title,
                        lifeHistory[index].text,
                      ],
                      transition: Transition.native,
                      duration: Duration(milliseconds: 500),
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
                                    text: "\n${lifeHistory[index].title}",
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
