import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/menu_item.dart';
import '../utils/constants.dart';
import '../widgets/menu_grid_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Define menu items for the first design (sketch-like)
    final List<MenuItem> menuItems = [
      MenuItem(
        title: AppStrings.sermons,
        textColor: Colors.lightBlue,
        onTap: () {
          // Navigate to sermons screen
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Sermons tapped')));
        },
      ),
      MenuItem(
        title: AppStrings.readings,
        textColor: Colors.orange,
        onTap: () {
          // Navigate to readings screen
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Readings tapped')));
        },
      ),
      MenuItem(
        title: AppStrings.music,
        textColor: Colors.lightBlue,
        onTap: () {
          // Navigate to music screen
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Music tapped')));
        },
      ),
      MenuItem(
        title: AppStrings.prayer,
        textColor: Colors.orange,
        onTap: () {
          // Navigate to prayer screen
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Prayer tapped')));
        },
      ),
      MenuItem(
        title: AppStrings.videos,
        textColor: Colors.lightBlue,
        onTap: () {
          // Navigate to videos screen
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Videos tapped')));
        },
      ),
      MenuItem(
        title: AppStrings.podcasts,
        textColor: Colors.orange,
        onTap: () {
          // Navigate to podcasts screen
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Podcasts tapped')));
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
            // Logo and title
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  children: [
                    SvgPicture.asset(
                      AppAssets.logo,
                      width: 40,
                      height: 40,
                      placeholderBuilder:
                          (context) => const Icon(
                            Icons.local_fire_department,
                            color: AppColors.primary,
                            size: 40,
                          ),
                    ),
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

            // Welcome text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Center(
                child: Text(
                  'WELCOME\nhome',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w300,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Menu grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                return MenuGridItem(
                  item: menuItems[index],
                  isSketchStyle: true,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
