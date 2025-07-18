import 'package:flutter/material.dart';
import '../models/menu_item.dart';
import '../utils/constants.dart';

class MenuGridItem extends StatelessWidget {
  final MenuItem item;
  final VoidCallback onTap;

  const MenuGridItem({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (item.imagePath != null)
              Image.asset(item.imagePath!, width: 60, height: 60)
            else
              Icon(item.icon, size: 40, color: AppColors.textPrimary),
            const SizedBox(height: 8),
            Text(
              item.title,
              style: const TextStyle(
                color: AppColors.textSecondary,
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
}
