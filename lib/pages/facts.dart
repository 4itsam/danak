import 'package:danak/models/fact_models.dart';
import 'package:danak/pages/text_page.dart';
import 'package:danak/theme.dart';
import 'package:danak/ui/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Facts extends StatefulWidget {
  const Facts({super.key});

  @override
  State<Facts> createState() => _FactsState();
}

class _FactsState extends State<Facts> {
  List<FactModels> factModels = [];
  void getFactModels() {
    factModels = FactModels.getFactModels();
  }

  @override
  Widget build(BuildContext context) {
    getFactModels();
    return Scaffold(
      appBar: AppBar(
        title: Text(RowSection.TextFacts, style: rowSectionTitle),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverList.builder(
              itemCount: factModels.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: InkWell(
                    onTap: () => Get.to(
                      () => TextPage(),
                      arguments: [
                        factModels[index].title,
                        factModels[index].text,
                      ],
                      transition: Transition.native,
                      duration: Duration(milliseconds: 500),
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
                                factModels[index].title,
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
