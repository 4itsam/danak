import 'package:danak/components/components.dart';
import 'package:danak/gen/assets.gen.dart';
import 'package:danak/theme/app_strings.dart';
import 'package:danak/theme/colors.dart';
import 'package:danak/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/adapters.dart';

class Note extends StatefulWidget {
  const Note({super.key});

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  var noteBox = Hive.box("notes");
  final TextEditingController _noteTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(RowSection.textNote, style: AppTextStyle.rowSectionTitle),
      ),
      backgroundColor: SolidColors.scaffoldBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(right: 16.w, left: 16.w),
            child: Column(
              children: [
                ListenableBuilder(
                  listenable: noteBox.listenable(),
                  builder: (context, child) {
                    if (noteBox.length == 0) {
                      return emptyPage(context);
                    } else {
                      return notes();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: floatingACButton(context),
    );
  }

  Padding notes() {
    return Padding(
      padding: EdgeInsets.only(top: 24.h, bottom: 100.h),
      child: Column(
        children: List.generate(noteBox.length, (index) {
          return Column(
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 900),
              childAnimationBuilder: (widget) => ScaleAnimation(
                duration: const Duration(milliseconds: 1100),
                delay: const Duration(milliseconds: 900),
                scale: 1,
                curve: Curves.easeIn,
                child: ScaleAnimation(child: widget),
              ),
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(20.r),

                  onTap: () {
                    Get.dialog(deleteNote(index));
                  },
                  child: noteBody(index),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  SizedBox noteBody(int index) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: Container(
          decoration: AppBoxDecoration.noteBoxDecoration,
          child: Padding(
            padding: EdgeInsets.all(16.r),
            child: Text(
              textAlign: TextAlign.center,
              noteBox.getAt(index),
              style: AppTextStyle.bodyTextStyle,
            ),
          ),
        ),
      ),
    );
  }

  SizedBox deleteNote(int index) {
    return SizedBox(
      height: 100.h,
      width: 100.w,
      child: AlertDialog(
        backgroundColor: SolidColors.cardBackground,

        alignment: Alignment.bottomCenter,
        content: SizedBox(
          height: 100.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(NoteText.deleteNote, style: AppTextStyle.hintNoteTextStyle),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: SolidColors.primaryColor,
                        ),
                        onPressed: () {
                          noteBox.deleteAt(index);
                          Get.back();
                        },
                        child: Text(
                          NoteText.deleteNoteAction,
                          style: AppTextStyle.exitTextStyle,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: SolidColors.cancelColor,
                    ),
                    onPressed: () => Get.back(),
                    child: Text(
                      NoteText.cancel,
                      style: AppTextStyle.changeInfoTextStyle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox emptyPage(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 150.h,
      child: Center(
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.images.empty, height: 150.h, width: 150.w),
            Text(NoteText.noteEmptyText, style: AppTextStyle.hintNoteTextStyle),
          ],
        ),
      ),
    );
  }

  Align floatingACButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: EdgeInsets.only(right: 25.w),
        child: InkWell(
          onTap: () {
            Get.bottomSheet(
              backgroundColor: SolidColors.cardBackground,
              Padding(
                padding: EdgeInsetsGeometry.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom.h,
                ),
                child: SizedBox(
                  height: 200.h,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(16.r),
                    child: Column(
                      spacing: 10,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            NoteText.addTextHint,
                            style: AppTextStyle.hintNoteTextStyle,
                          ),
                        ),
                        textFieldGen(
                          controller: _noteTitleController,
                          text: "برای مثال: تکمیل پایان نامه",
                          autofocus: true,
                          textInputAction: TextInputAction.done,
                          maxLength: 300,
                        ),

                        SizedBox(
                          height: 50.h,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: AppBoxDecoration.elevatedButtonTheme,

                            child: Text(
                              NoteText.addText,
                              style: AppTextStyle.bannerTextStyle,
                            ),
                            onPressed: () {
                              if (_noteTitleController.text.isNotEmpty) {
                                noteBox.add(_noteTitleController.text);
                                _noteTitleController.clear();
                                Get.back();
                              } else {
                                Get.back();
                                Get.snackbar("خطا", "لطفا فیلد رو پر کنید");
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          child: Container(
            height: 50.h,
            width: 200.w,
            decoration: AppBoxDecoration.rowBoxDecoration,
            child: Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  NoteText.addText,
                  style: AppTextStyle.theoryBannerSubStyle,
                ),
                Icon(
                  Icons.add_rounded,
                  size: 30.r,
                  color: SolidColors.primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
