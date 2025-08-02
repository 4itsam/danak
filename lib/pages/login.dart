// import 'package:danak/gen/assets.gen.dart';
// import 'package:danak/pages/text_page.dart';
// import 'package:danak/ui/text.dart';
// import 'package:danak/ui/theme.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';

// class Login extends StatefulWidget {
//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   final TextEditingController _nameController = TextEditingController();

//   final TextEditingController _majorController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       backgroundColor: scaffoldBackground,

//       body: SafeArea(
//         child: LayoutBuilder(
//           builder: (context, constraints) {
//             return SingleChildScrollView(
//               child: ConstrainedBox(constraints: BoxConstraints(minHeight: constraints.maxHeight),
//                 child: IntrinsicHeight(
//                   child: Padding(
//                     padding: const EdgeInsets.all(30),
//                     child: Column(
//                       children: [
//                         appBarTitle(),
//                         const SizedBox(height: 50),
//                         Align(
//                           alignment: Alignment.topRight,
//                           child: Text(LoginText.loginName, style: textFeildText),
//                         ),
//                         const SizedBox(height: 10),
//                         textFeildGen(
//                           controller: _nameController,
//                           text: LoginText.loginNameExample,
//                         ),
//                         const SizedBox(height: 30),
//                         Align(
//                           alignment: Alignment.topRight,
//                           child: Text(LoginText.loginMajor, style: textFeildText),
//                         ),
//                         const SizedBox(height: 10),
//                         textFeildGen(
//                           controller: _majorController,
//                           text: LoginText.loginMajorExample,
//                         ),
//                         // SizedBox(height: size.height / 4),
//                         const Spacer(flex: 2),
//                         SvgPicture.asset(Assets.images.terms),
//                         const SizedBox(height: 20),
//                         SizedBox(
//                           width: 250,
//                           child: GestureDetector(
//                             onTap: () => Get.to(
//                               () => TextPage(),
//                               arguments: [privacy, privacyText],
//                               transition: Transition.fade,
//                             ),
//                             child: Text.rich(
//                               textAlign: TextAlign.center,
//                               TextSpan(
//                                 text: "با ورود به برنامه با ",
//                                 style: termsNormalStyle,
//                                 children: <TextSpan>[
//                                   TextSpan(
//                                     text:
//                                         "قوانین استفاده از اپلیکیشن و حریم خصوصی ",
//                                     style: termsBoldStyle,
//                                   ),
//                                   const TextSpan(text: "موافقت می کنید"),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         SizedBox(
//                           height: 50,
//                           width: double.infinity,
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: primaryColor,
                  
//                               overlayColor: Colors.white60,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadiusGeometry.circular(15),
//                                 side: const BorderSide(
//                                   color: Colors.white,
//                                   width: 1.5,
//                                   style: BorderStyle.solid,
//                                 ),
//                               ),
//                             ),
//                             onPressed: () {
//                               Get.back(closeOverlays: true);
//                             },
//                             child: Text(
//                               LoginText.loginBotton,
//                               style: loginBottonActionStyle,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   TextField textFeildGen({required controller, required text}) {
//     return TextField(
//       controller: controller,
//       decoration: InputDecoration(
//         hintText: text,
//         hintStyle: hintTextStyle,
//         fillColor: textFeildBackgroundColor,
//         filled: true,
//         alignLabelWithHint: true,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//           borderSide: const BorderSide(),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//           borderSide: const BorderSide(color: Colors.white, width: 1),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(22),
//           borderSide: BorderSide(color: primaryColor, width: 2),
//         ),
//       ),
//     );
//   }

//   Align appBarTitle() {
//     return Align(
//       alignment: Alignment.topRight,
//       child: Text.rich(
//         TextSpan(
//           text: LoginText.appBarText,
//           style: appBarLoginTextStyle,
//           children: <TextSpan>[
//             TextSpan(
//               text: '\n${LoginText.appBarSubText}',
//               style: bodyTextStyle,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
