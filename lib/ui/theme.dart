// import 'package:flutter/material.dart';
// import 'package:danak/gen/fonts.gen.dart';
// import 'colors.dart';

// class AppTheme {
//   // Colors
//   static const Color primaryColor = Color(0xffE91E62);
//   static const Color scaffoldBackground = Color(0xffF2F2F2);
//   static const Color textBlackTitle = Color(0xff212121);
//   static const Color subTextBlackTitle = Color(0xff434343);
//   static const Color cardBackground = Colors.white;
//   static const Color dividerColor = Color(0xffE0E0E0);
//   static const Color shadowColor = Color(0x1A000000);

//   // Text Styles
//   static const TextStyle headingStyle = TextStyle(
//     fontFamily: FontFamily.iranYekan,
//     fontSize: 18,
//     fontWeight: FontWeight.w600,
//     color: textBlackTitle,
//   );

//   static const TextStyle titleStyle = TextStyle(
//     fontFamily: FontFamily.iranYekan,
//     fontSize: 16,
//     fontWeight: FontWeight.w500,
//     color: textBlackTitle,
//   );

//   static const TextStyle bodyStyle = TextStyle(
//     fontFamily: FontFamily.iranYekan,
//     fontSize: 14,
//     fontWeight: FontWeight.w400,
//     color: textBlackTitle,
//   );

//   static const TextStyle captionStyle = TextStyle(
//     fontFamily: FontFamily.iranYekan,
//     fontSize: 12,
//     fontWeight: FontWeight.w400,
//     color: subTextBlackTitle,
//   );

//   static const TextStyle buttonStyle = TextStyle(
//     fontFamily: FontFamily.iranYekan,
//     fontSize: 14,
//     fontWeight: FontWeight.w500,
//     color: Colors.white,
//   );

//   // Container Styles
//   static BoxDecoration cardDecoration = BoxDecoration(
//     color: cardBackground,
//     borderRadius: BorderRadius.circular(12),
//     boxShadow: [
//       BoxShadow(color: shadowColor, blurRadius: 8, offset: const Offset(0, 2)),
//     ],
//   );

//   static BoxDecoration primaryCardDecoration = BoxDecoration(
//     color: primaryColor,
//     borderRadius: BorderRadius.circular(12),
//     boxShadow: [
//       BoxShadow(
//         color: primaryColor.withOpacity(0.3),
//         blurRadius: 8,
//         offset: const Offset(0, 2),
//       ),
//     ],
//   );

//   static BoxDecoration roundedDecoration = BoxDecoration(
//     color: cardBackground,
//     borderRadius: BorderRadius.circular(20),
//     boxShadow: [
//       BoxShadow(color: shadowColor, blurRadius: 8, offset: const Offset(0, 2)),
//     ],
//   );

//   // Button Styles
//   static ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
//     backgroundColor: primaryColor,
//     foregroundColor: Colors.white,
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//     textStyle: buttonStyle,
//   );

//   static ButtonStyle secondaryButtonStyle = ElevatedButton.styleFrom(
//     backgroundColor: Colors.transparent,
//     foregroundColor: primaryColor,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(12),
//       side: const BorderSide(color: primaryColor, width: 1),
//     ),
//     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//     textStyle: buttonStyle.copyWith(color: primaryColor),
//   );

//   // Input Decoration
//   static InputDecoration inputDecoration = InputDecoration(
//     filled: true,
//     fillColor: cardBackground,
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: const BorderSide(color: dividerColor),
//     ),
//     enabledBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: const BorderSide(color: dividerColor),
//     ),
//     focusedBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: const BorderSide(color: primaryColor, width: 2),
//     ),
//     contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//     hintStyle: captionStyle.copyWith(color: subTextBlackTitle),
//   );

//   // App Bar Theme
//   static AppBarTheme appBarTheme = const AppBarTheme(
//     backgroundColor: cardBackground,
//     foregroundColor: textBlackTitle,
//     elevation: 0,
//     centerTitle: true,
//     titleTextStyle: titleStyle,
//     iconTheme: IconThemeData(color: textBlackTitle),
//   );

//   // Bottom Navigation Bar Theme
//   static BottomNavigationBarThemeData bottomNavTheme =
//       const BottomNavigationBarThemeData(
//         backgroundColor: cardBackground,
//         selectedItemColor: primaryColor,
//         unselectedItemColor: subTextBlackTitle,
//         type: BottomNavigationBarType.fixed,
//         elevation: 8,
//       );

//   // Card Theme
//   static CardThemeData cardTheme = CardThemeData(
//     color: cardBackground,
//     elevation: 2,
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//     margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//   );

//   // Divider Theme
//   static DividerThemeData dividerTheme = const DividerThemeData(
//     color: dividerColor,
//     thickness: 1,
//     space: 1,
//   );

//   // Icon Theme
//   static IconThemeData iconTheme = const IconThemeData(
//     color: textBlackTitle,
//     size: 24,
//   );

//   // Floating Action Button Theme
//   static FloatingActionButtonThemeData fabTheme =
//       const FloatingActionButtonThemeData(
//         backgroundColor: primaryColor,
//         foregroundColor: Colors.white,
//         elevation: 4,
//       );

//   // Input Decoration Theme
//   static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
//     filled: true,
//     fillColor: cardBackground,
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: const BorderSide(color: dividerColor),
//     ),
//     enabledBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: const BorderSide(color: dividerColor),
//     ),
//     focusedBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: const BorderSide(color: primaryColor, width: 2),
//     ),
//     contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//     hintStyle: captionStyle.copyWith(color: subTextBlackTitle),
//   );

//   // Material Theme Data
//   static ThemeData get lightTheme {
//     return ThemeData(
//       primaryColor: primaryColor,
//       scaffoldBackgroundColor: scaffoldBackground,
//       fontFamily: FontFamily.iranYekan,
//       appBarTheme: appBarTheme,
//       bottomNavigationBarTheme: bottomNavTheme,
//       cardTheme: cardTheme,
//       dividerTheme: dividerTheme,
//       iconTheme: iconTheme,
//       floatingActionButtonTheme: fabTheme,
//       elevatedButtonTheme: ElevatedButtonThemeData(style: primaryButtonStyle),
//       inputDecorationTheme: inputDecorationTheme,
//       useMaterial3: true,
//     );
//   }
// }
