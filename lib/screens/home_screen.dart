import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/menu_item.dart';
import '../models/banner_item.dart';
import '../utils/constants.dart';
import '../widgets/menu_grid_item.dart';
import '../widgets/banner_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Define menu items for the first design (sketch-like)
    final List<MenuItem> menuItems = [
      MenuItem(title: AppStrings.sermons, icon: Icons.book, route: '/sermons'),
      MenuItem(
        title: AppStrings.readings,
        icon: Icons.menu_book,
        route: '/readings',
      ),
      MenuItem(
        title: AppStrings.music,
        icon: Icons.music_note,
        route: '/music',
      ),
      MenuItem(
        title: AppStrings.prayer,
        icon: Icons.volunteer_activism,
        route: '/prayer',
      ),
      MenuItem(
        title: AppStrings.videos,
        icon: Icons.video_library,
        route: '/videos',
      ),
      MenuItem(title: AppStrings.podcasts, icon: Icons.mic, route: '/podcasts'),
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
            // Logo and title
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  children: [
                    SvgPicture.asset(AppAssets.logo, width: 40, height: 40),
                    const SizedBox(height: 8),
                    const Text(
                      'UPPER ROOM',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Menu grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
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
