class BannerItem {
  final String imageUrl;
  final String title;
  final String? subtitle;
  final String route;

  BannerItem({
    required this.imageUrl,
    required this.title,
    this.subtitle,
    required this.route,
  });
}
