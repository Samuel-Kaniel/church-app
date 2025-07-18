import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/menu_item.dart';
import '../utils/constants.dart';
import '../services/url_service.dart';
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
          // Navigate to online Coptic sermons
          UrlService.openWebView(
            context,
            'https://www.copticchurch.net/sermons',
            'Coptic Sermons',
          );
        },
      ),
      MenuItem(
        title: AppStrings.readings,
        textColor: Colors.orange,
        onTap: () {
          // Navigate to online Bible readings
          UrlService.openWebView(
            context,
            'https://www.biblegateway.com/',
            'Bible Readings',
          );
        },
      ),
      MenuItem(
        title: AppStrings.music,
        textColor: Colors.lightBlue,
        onTap: () {
          // Navigate to Coptic hymns on YouTube
          UrlService.openWebView(
            context,
            'https://www.youtube.com/results?search_query=coptic+hymns',
            'Coptic Hymns',
          );
        },
      ),
      MenuItem(
        title: AppStrings.prayer,
        textColor: Colors.orange,
        onTap: () {
          // Navigate to prayer video
          UrlService.openWebView(
            context,
            'https://www.youtube.com/results?search_query=coptic+prayer',
            'Prayer',
          );
        },
      ),
      MenuItem(
        title: AppStrings.videos,
        textColor: Colors.lightBlue,
        onTap: () {
          // Navigate to Coptic liturgy video
          UrlService.openWebView(
            context,
            'https://www.youtube.com/results?search_query=coptic+liturgy',
            'Coptic Liturgy',
          );
        },
      ),
      MenuItem(
        title: AppStrings.podcasts,
        textColor: Colors.orange,
        onTap: () {
          // Navigate to Coptic Church website
          UrlService.openWebView(
            context,
            'https://www.copticchurch.net',
            'Coptic Church',
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
                  (context) =>
                      const Icon(Icons.church, color: AppColors.primary),
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
                      width: 80,
                      height: 80,
                      placeholderBuilder:
                          (context) => const Icon(
                            Icons.church,
                            color: AppColors.primary,
                            size: 80,
                          ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'ST. MARY DAILY PRAYER',
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
