import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/constants.dart';
import '../utils/image_urls.dart';
import '../services/url_service.dart';
import '../widgets/contact_button.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset(
              AppAssets.crossLogo,
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
            // Church image
            GestureDetector(
              onTap: () {
                _showJesusImageDialog(context);
              },
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppAssets.church),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black.withAlpha(128)],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'UPPER ROOM',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Contact buttons grid
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 2.5,
                children: [
                  _buildContactGridItem(
                    context,
                    AppStrings.give,
                    Icons.volunteer_activism,
                    () {
                      UrlService.openWebView(
                        context,
                        'https://www.copticchurch.net/donate',
                        'Donate',
                      );
                    },
                  ),
                  _buildContactGridItem(
                    context,
                    AppStrings.shop,
                    Icons.shopping_bag,
                    () {
                      UrlService.openWebView(
                        context,
                        'https://www.copticbookshop.com/',
                        'Coptic Bookshop',
                      );
                    },
                  ),
                  _buildContactGridItem(
                    context,
                    AppStrings.instagram,
                    Icons.camera_alt,
                    () {
                      UrlService.openWebView(
                        context,
                        'https://www.instagram.com/copticchurch/',
                        'Instagram',
                      );
                    },
                  ),
                  _buildContactGridItem(
                    context,
                    AppStrings.facebook,
                    Icons.facebook,
                    () {
                      UrlService.openWebView(
                        context,
                        'https://www.facebook.com/CopticOrthodoxChurch/',
                        'Facebook',
                      );
                    },
                  ),
                  _buildContactGridItem(
                    context,
                    AppStrings.website,
                    Icons.language,
                    () {
                      UrlService.openWebView(
                        context,
                        ImageUrls.copticChurchWebsite,
                        'Coptic Church Website',
                      );
                    },
                  ),
                  _buildContactGridItem(
                    context,
                    AppStrings.contactUs,
                    Icons.email,
                    () {
                      UrlService.launchExternalUrl(
                        'mailto:contact@copticchurch.net',
                      );
                    },
                  ),
                ],
              ),
            ),

            // About text
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'About Us',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Upper Room is a vibrant Orthodox Christian Church. Its mission is to bring the word of God from a timeless faith into your hearts and minds anywhere at anytime.',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'The Orthodox Church worships God in continuity with the ancient Church, and is said to be the oldest Church. It is a balance between spirituality and theology, between the worship of God and service to humanity. Everything in Orthodoxy is a balance between spirituality and theology, between the worship of God and service to humanity.',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'The Orthodox Church worships God in spirit and in truth (John 4:24) and intentionally incarnates that truth in every age among all peoples of all walks of life to love God, others, and themselves.',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Contact us for more information:',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ContactButton(
                    title: 'Email Us',
                    icon: Icons.email,
                    onTap: () {
                      UrlService.launchExternalUrl(
                        'mailto:contact@copticchurch.net',
                      );
                    },
                  ),
                  ContactButton(
                    title: 'Call Us',
                    icon: Icons.phone,
                    onTap: () {
                      UrlService.launchExternalUrl('tel:+11234567890');
                    },
                  ),
                  ContactButton(
                    title: 'Visit Us',
                    icon: Icons.location_on,
                    onTap: () {
                      UrlService.launchExternalUrl(
                        'https://maps.app.goo.gl/JGJKqLBtPgHMXvSS6',
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactGridItem(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.primary),
            const SizedBox(height: 4),
            Text(
              title,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
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
                      'Jesus Christ with Angels',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'The Son of God surrounded by heavenly hosts',
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
