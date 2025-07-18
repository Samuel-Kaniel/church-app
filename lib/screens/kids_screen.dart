import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/menu_item.dart';
import '../models/banner_item.dart';
import '../utils/constants.dart';
import '../utils/image_urls.dart';
import '../services/url_service.dart';
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
          // Navigate to kid-friendly sermons
          UrlService.openWebView(
            context,
            ImageUrls.copticSermons,
            'Sermons for Kids',
          );
        },
      ),
      MenuItem(
        title: AppStrings.tunes,
        icon: Icons.music_note,
        onTap: () {
          // Navigate to Coptic hymns on YouTube
          UrlService.openWebView(
            context,
            ImageUrls.copticHymnsPlaylist,
            'Coptic Hymns',
          );
        },
      ),
      MenuItem(
        title: AppStrings.cartoons,
        icon: Icons.movie,
        onTap: () {
          // Navigate to Christian cartoons
          UrlService.openWebView(
            context,
            'https://www.youtube.com/results?search_query=christian+cartoons+for+kids',
            'Christian Cartoons',
          );
        },
      ),
      MenuItem(
        title: AppStrings.learning,
        icon: Icons.school,
        onTap: () {
          // Navigate to Bible for kids
          UrlService.openWebView(
            context,
            'https://bibleforchildren.org/',
            'Bible for Children',
          );
        },
      ),
    ];

    // Define banner items
    final List<BannerItem> banners = [
      BannerItem(
        imageUrl: AppAssets.banner1,
        title: 'HAVING PEACE IN ALL CIRCUMSTANCES',
        onTap: () {
          // Show a random Jesus image
          _showJesusImageDialog(context);
        },
      ),
      BannerItem(
        imageUrl: AppAssets.banner2,
        title: 'WELCOME HOME',
        onTap: () {
          // Show a random Jesus image
          _showJesusImageDialog(context);
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

  void _showJesusImageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.network(
                  ImageUrls.getRandomJesusImage(),
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return SizedBox(
                      height: 300,
                      child: Center(
                        child: CircularProgressIndicator(
                          value:
                              loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                        ),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const SizedBox(
                      height: 300,
                      child: Center(child: Icon(Icons.error, size: 50)),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Jesus Christ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'The Son of God, our Savior',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Close'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
