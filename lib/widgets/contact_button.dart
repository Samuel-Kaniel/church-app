import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ContactButton extends StatelessWidget {
  final String title;
  final IconData? icon;
  final VoidCallback? onTap;

  const ContactButton({super.key, required this.title, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.divider, width: 1),
          ),
        ),
        child: Row(
          children: [
            if (icon != null)
              Icon(icon, color: AppColors.textPrimary, size: 20),
            if (icon != null) const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 16,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.textSecondary,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
