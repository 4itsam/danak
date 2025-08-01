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
