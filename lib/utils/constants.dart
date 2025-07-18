import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFFFA500); // Orange color for the flame
  static const Color secondary = Color(0xFF4A90E2); // Blue for accents
  static const Color background = Colors.white;
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF666666);
  static const Color divider = Color(0xFFEEEEEE);
}

class AppTextStyles {
  static const TextStyle heading1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    color: AppColors.textPrimary,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 14,
    color: AppColors.textSecondary,
  );
}

class AppStrings {
  static const String appName = 'Upper Room';
  static const String home = 'Home';
  static const String kids = 'Kids';
  static const String forYou = 'For You';
  static const String more = 'More';

  // Menu items from the screenshots
  static const String sermons = 'SERMONS';
  static const String readings = 'READINGS';
  static const String music = 'MUSIC';
  static const String prayer = 'PRAYER';
  static const String videos = 'VIDEOS';
  static const String podcasts = 'PODCASTS';
  static const String tunes = 'TUNES';
  static const String cartoons = 'CARTOONS';
  static const String learning = 'LEARNING';

  // Information page
  static const String whoIsJesus = 'WHO IS JESUS?';
  static const String whatIsChristianity = 'WHAT IS CHRISTIANITY?';
  static const String whatIsMyIdentity = 'WHAT IS MY IDENTITY?';
  static const String whatIsMyPurpose = 'WHAT IS MY PURPOSE?';

  // Contact info
  static const String give = 'Give';
  static const String shop = 'Shop';
  static const String instagram = 'Instagram';
  static const String facebook = 'Facebook';
  static const String website = 'Website';
  static const String contactUs = 'Contact Us';
}

class AppAssets {
  static const String logo = 'assets/images/logo.svg';
  static const String church = 'assets/images/church.jpg';
  static const String banner1 = 'assets/images/banner1.jpg';
  static const String banner2 = 'assets/images/banner2.jpg';
}
