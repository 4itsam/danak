class Tips {
  String tips;

  Tips({required this.tips});
  static List<Tips> getTips() {
    List<Tips> tips = [];
    tips.add(Tips(tips: 'برای نمایش سریع متن\nبر روی آن کلیک کنید'));
    tips.add(
      Tips(tips: "همواره پذیرای انتقادات و پیشنهادات\nشما عزیزان هستیم"),
    );
    tips.add(
      Tips(
        tips:
            "در صورت تمایل به همکاری میتوانید\nاز طریق تلگرام با ما در ارتباط باشید",
      ),
    );
    return tips;
  }
}
