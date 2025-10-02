import 'package:danak/components/add_note.dart';
import 'package:danak/components/app_bar.dart';
import 'package:danak/gen/assets.gen.dart';
import 'package:danak/theme/colors.dart';
import 'package:danak/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

// ignore: must_be_immutable
class Note extends StatelessWidget {
  var box = Hive.box("notes");

  Note({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SolidColors.appBarBackground,
      floatingActionButton: Align(
        alignment: const Alignment(-0.1, 1),
        child: SizedBox(
          width: 250.w,
          child: ElevatedButton(
              style: AppBoxDecoration.elevatedButtonTheme,
              onPressed: () {
                Get.to(() => AddNote());
              },
              child: Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "اضافه کردن یادداشت",
                    style: AppTextStyle.addNoteTextStyle,
                  ),
                  const Icon(
                    CupertinoIcons.add,
                    color: Colors.white,
                  ),
                ],
              )),
        ),
      ),
      appBar: myAppBar(text: "یادداشت"),
      body: ValueListenableBuilder(
          valueListenable: box.listenable(),
          builder: (context, Box box, _) {
            if (box.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.images.empty),
                    Text(
                      "یادداشت ذخیره شده ای ندارید",
                      style: AppTextStyle.noteEmptyPage,
                    ),
                  ],
                ),
              );
            }
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                var note = box.getAt(index);
                return Padding(
                    padding: EdgeInsetsGeometry.only(
                        left: 16.w,
                        right: 16.w,
                        bottom: index == box.length - 1 ? 100.h : 10.h),
                    child: Dismissible(
                      background: Container(
                        color: Colors.red,
                      ),
                      key: Key(note['title'] ?? index.toString()),
                      direction: DismissDirection.endToStart,
                      behavior: HitTestBehavior.deferToChild,
                      onDismissed: (direction) {
                        box.deleteAt(index);
                      },
                      child: ExpansionTile(
                        collapsedShape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(20)),
                        collapsedBackgroundColor:
                            SolidColors.collapsedBackgroundColor,
                        dense: true,
                        showTrailingIcon: true,
                        enableFeedback: false,
                        expansionAnimationStyle: const AnimationStyle(
                            curve: Curves.easeIn,
                            duration: Duration(milliseconds: 250),
                            reverseCurve: Curves.easeOut,
                            reverseDuration: Duration(milliseconds: 250)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(20),
                            side: BorderSide(
                                width: 2, color: SolidColors.primaryColor)),
                        childrenPadding: EdgeInsets.all(16.r),
                        title: Text(
                          textAlign: TextAlign.start,
                          note['title'] ?? "",
                          style: AppTextStyle.NoteSubject,
                        ),
                        backgroundColor: SolidColors.textFeildBackgroundColor,
                        children: [
                          Text(
                              textAlign: TextAlign.start, note['detail'] ?? ""),
                        ],
                      ),
                    ));
              },
            );
          }),
    );
  }
}
