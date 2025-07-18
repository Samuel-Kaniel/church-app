import 'package:flutter/material.dart';
import '../models/menu_item.dart';
import '../utils/constants.dart';

class MenuGridItem extends StatelessWidget {
  final MenuItem item;
  final bool isSketchStyle;

  const MenuGridItem({
    super.key,
    required this.item,
    this.isSketchStyle = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: item.onTap,
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isSketchStyle)
              _buildSketchStyleIcon()
            else if (item.imagePath != null)
              Image.asset(item.imagePath!, width: 60, height: 60)
            else if (item.icon != null)
              Icon(item.icon, size: 40, color: AppColors.primary),
            const SizedBox(height: 8),
            Text(
              item.title,
              style: TextStyle(
                color: item.textColor ?? AppColors.textSecondary,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSketchStyleIcon() {
    // This would be replaced with actual sketch-style images in a real app
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Icon(_getIconForTitle(item.title), size: 40, color: Colors.grey),
      ),
    );
  }

  IconData _getIconForTitle(String title) {
    switch (title) {
      case AppStrings.sermons:
        return Icons.book;
      case AppStrings.readings:
        return Icons.menu_book;
      case AppStrings.music:
        return Icons.music_note;
      case AppStrings.prayer:
        return Icons.volunteer_activism;
      case AppStrings.videos:
        return Icons.video_library;
      case AppStrings.podcasts:
        return Icons.mic;
      case AppStrings.tunes:
        return Icons.music_note;
      case AppStrings.cartoons:
        return Icons.movie;
      case AppStrings.learning:
        return Icons.school;
      default:
        return Icons.circle;
    }
  }
}
