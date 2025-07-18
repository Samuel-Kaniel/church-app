class ImageUrls {
  // Religious images
  static const List<String> jesusImages = [
    'https://upload.wikimedia.org/wikipedia/commons/4/4a/Spas_vsederzhitel_sinay.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Christus_Ravenna_Mosaic.jpg/800px-Christus_Ravenna_Mosaic.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Jesus_and_Mary_Icon_Sinai_13th_century.jpg/800px-Jesus_and_Mary_Icon_Sinai_13th_century.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/Cima_da_Conegliano%2C_God_the_Father.jpg/800px-Cima_da_Conegliano%2C_God_the_Father.jpg',
  ];

  // Coptic resources
  static const String copticChurchWebsite = 'https://www.copticchurch.net/';
  static const String copticBible = 'https://www.copticchurch.net/bible';
  static const String copticSermons = 'https://www.copticchurch.net/sermons';
  static const String copticReadings = 'https://www.copticchurch.net/readings';

  // YouTube links
  static const String copticHymnsPlaylist =
      'https://www.youtube.com/playlist?list=PLiMzpxDQcPSNxLJHLPNm8ePC3_4LiIH0L';
  static const String copticLiturgyVideo =
      'https://www.youtube.com/watch?v=__kMpuaSA_0';
  static const String copticPrayerVideo =
      'https://www.youtube.com/watch?v=O4XD4z6JufU';

  // Online Bible resources
  static const String bibleGateway = 'https://www.biblegateway.com/';
  static const String biblehub = 'https://biblehub.com/';

  // Get a random Jesus image URL
  static String getRandomJesusImage() {
    jesusImages.shuffle();
    return jesusImages.first;
  }
}
