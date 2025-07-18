import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/menu_item.dart';
import '../models/banner_item.dart';
import '../utils/constants.dart';
import '../widgets/menu_grid_item.dart';
import '../widgets/banner_slider.dart';

class KidsScreen extends StatelessWidget {
  const KidsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Define menu items for the second design (modern with icons)
    final List<MenuItem> menuItems = [
      MenuItem(
        title: AppStrings.sermons,
        icon: Icons.church,
        onTap: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Sermons tapped')));
        },
      ),
      MenuItem(
        title: AppStrings.tunes,
        icon: Icons.music_note,
        onTap: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Tunes tapped')));
        },
      ),
      MenuItem(
        title: AppStrings.cartoons,
        icon: Icons.movie,
        onTap: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Cartoons tapped')));
        },
      ),
      MenuItem(
        title: AppStrings.learning,
        icon: Icons.school,
        onTap: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Learning tapped')));
        },
      ),
    ];

    // Define banner items
    final List<BannerItem> banners = [
      BannerItem(
        imageUrl: AppAssets.banner1,
        title: 'HAVING PEACE IN ALL CIRCUMSTANCES',
        onTap: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Peace banner tapped')));
        },
      ),
      BannerItem(
        imageUrl: AppAssets.banner2,
        title: 'WELCOME HOME',
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Welcome banner tapped')),
          );
        },
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset(
              AppAssets.logo,
              width: 24,
              height: 24,
              placeholderBuilder:
                  (context) => const Icon(
                    Icons.local_fire_department,
                    color: AppColors.primary,
                  ),
            ),
            const SizedBox(width: 8),
            const Text(AppStrings.appName),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Search tapped')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Settings tapped')));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner slider
            BannerSlider(banners: banners),

            const SizedBox(height: 24),

            // Menu grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                return MenuGridItem(item: menuItems[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
