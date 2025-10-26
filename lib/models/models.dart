import 'dart:ui';

class TheoryModels {
  final String title;
  final String author;
  final String text;
  TheoryModels({required this.title, required this.author, required this.text});
}

class LifeHistoryModel {
  final String title;
  final String text;
  LifeHistoryModel({required this.title, required this.text});
}

class FactModels {
  final String title;
  final String text;

  FactModels({required this.title, required this.text});
}

class BannerModels {
  String title;
  String subTitle;
  String image;
  String text;
  VoidCallback onTap;
  BannerModels({
    required this.title,
    required this.subTitle,
    required this.image,
    required this.text,
    required this.onTap,
  });
}

class Tips {
  final String tips;

  Tips({required this.tips});
}

class HomeAbility {
  String title;
  String image;
  VoidCallback onTap;
  HomeAbility({required this.title, required this.image, required this.onTap});
}

class AbilityFeild {
  String text;
  String image;
  VoidCallback onTap;

  AbilityFeild({required this.text, required this.image, required this.onTap});
}

class Notes {
  String text;
  Notes({required this.text});
}

class Club {
  String imageClub;
  String titleClub;
  Club({required this.imageClub, required this.titleClub});
}