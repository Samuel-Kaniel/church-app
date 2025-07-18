class BannerItem {
  final String imageUrl;
  final String title;
  final String? subtitle;
  final String? route;
  final Function()? onTap;

  BannerItem({
    required this.imageUrl,
    required this.title,
    this.subtitle,
    this.route,
    this.onTap,
  });
}
