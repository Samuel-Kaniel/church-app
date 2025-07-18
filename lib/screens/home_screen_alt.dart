import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/menu_item.dart';
import '../models/banner_item.dart';
import '../utils/constants.dart';
import '../widgets/menu_grid_item.dart';
import '../widgets/banner_slider.dart';

class HomeScreenAlt extends StatelessWidget {
  const HomeScreenAlt({super.key});

  @override
  Widget build(BuildContext context) {
    // Define menu items for the second design (modern with icons)
    final List<MenuItem> menuItems = [
      MenuItem(title: AppStrings.sermons, icon: Icons.book, route: '/sermons'),
      MenuItem(
        title: AppStrings.tunes,
        icon: Icons.music_note,
        route: '/tunes',
      ),
      MenuItem(
        title: AppStrings.cartoons,
        icon: Icons.movie,
        route: '/cartoons',
      ),
      MenuItem(
        title: AppStrings.learning,
        icon: Icons.school,
        route: '/learning',
      ),
    ];

    // Define banner items
    final List<BannerItem> banners = [
      BannerItem(
        imageUrl: AppAssets.banner1,
        title: 'HAVING PEACE IN ALL CIRCUMSTANCES',
        route: '/peace',
      ),
      BannerItem(
        imageUrl: AppAssets.banner2,
        title: 'WELCOME HOME',
        route: '/welcome',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset(AppAssets.logo, width: 24, height: 24),
            const SizedBox(width: 8),
            const Text(AppStrings.appName),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
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
                return MenuGridItem(
                  item: menuItems[index],
                  onTap: () {
                    // Navigate to the menu item's route
                    // Navigator.pushNamed(context, menuItems[index].route);
                  },
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AppStrings.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.child_care),
            label: AppStrings.kids,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: AppStrings.forYou,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: AppStrings.more,
          ),
        ],
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }
}
