import 'package:danak/components/error_handler.dart';
import 'package:danak/components/text_field.dart';
import 'package:danak/theme/app_strings.dart';
import 'package:danak/theme/colors.dart';
import 'package:danak/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/adapters.dart';

// ignore: must_be_immutable
class AddNote extends StatelessWidget {
  AddNote({super.key});
  TextEditingController titleController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  var box = Hive.box("notes");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SolidColors.appBarBackground,
      appBar: AppBar(
        backgroundColor: SolidColors.appBarBackground,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: ValueListenableBuilder(
          valueListenable: box.listenable(),
          builder: (context, Box box, _) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 20.h),
                        textFieldGen(
                          autofocus: true,
                          maxLength: 50,
                          text: NoteText.subject,
                          controller: titleController,
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(height: 20.h),
                        textFieldGen(
                          autofocus: true,
                          maxLength: 1000,
                          text: NoteText.detail,
                          controller: detailController,
                          textInputAction: TextInputAction.newline,
                          maxLine: null,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      final String title = titleController.text;
                      final String detail = detailController.text;
                      if (title.isEmpty || detail.isEmpty) {
                        errorLoginWidget();
                      } else {
                        box.add({"title": title, "detail": detail});
                        Get.back();
                      }
                    },
                    style: AppBoxDecoration.elevatedButtonTheme,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          NoteText.save,
                          style: AppTextStyle.loginBottonActionStyle,
                        ),
                        SizedBox(width: 10.w),
                        const Icon(
                          Icons.save,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
