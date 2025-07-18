import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/constants.dart';
import '../services/url_service.dart';

class ForYouScreen extends StatelessWidget {
  const ForYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Define info cards with their respective sections from the image
    final List<Map<String, dynamic>> infoCards = [
      {
        'title': AppStrings.whoIsJesus,
        'description':
            'Learn about Jesus Christ, His life, teachings, and significance in Christianity.',
        'backgroundColor': const Color(0xFFF8F8F8),
        'textColor': Colors.black,
        'webUrl': 'https://www.copticchurch.net/topics/thecopticchurch/jesus',
      },
      {
        'title': AppStrings.whatIsChristianity,
        'description':
            'Discover the core beliefs, values, and practices of the Christian faith.',
        'backgroundColor': const Color(0xFFF5E8D5),
        'textColor': Colors.black,
        'webUrl': 'https://www.copticchurch.net/topics/thecopticchurch/faith',
      },
      {
        'title': AppStrings.whatIsMyIdentity,
        'description':
            'Explore what it means to find your identity in Christ and as a child of God.',
        'backgroundColor': const Color(0xFFD5E8F5),
        'textColor': Colors.black,
        'webUrl':
            'https://www.copticchurch.net/topics/thecopticchurch/identity',
      },
      {
        'title': AppStrings.whatIsMyPurpose,
        'description':
            'Understand God\'s purpose for your life and how to fulfill your calling.',
        'backgroundColor': const Color(0xFF483D8B),
        'textColor': Colors.white,
        'webUrl': 'https://www.copticchurch.net/topics/thecopticchurch/purpose',
      },
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
            // Banner image with "I'm New" text
            GestureDetector(
              onTap: () {
                _showWelcomeDialog(context);
              },
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF87CEEB), Color(0xFFFFA07A)],
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withAlpha(100),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Center(
                      child: Text(
                        "I'm New",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              offset: Offset(1.0, 1.0),
                              blurRadius: 3.0,
                              color: Color.fromARGB(150, 0, 0, 0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 16,
                    child: ElevatedButton(
                      onPressed: () {
                        _showWelcomeDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppColors.primary,
                      ),
                      child: const Text('Get Started'),
                    ),
                  ),
                ],
              ),
            ),

            // Info cards
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Explore Your Faith',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  ...infoCards.map((card) => _buildInfoCard(context, card)),
                ],
              ),
            ),

            // Cross icon at the bottom
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Center(
                child: Column(
                  children: [
                    SvgPicture.asset(
                      AppAssets.crossLogo,
                      width: 100,
                      height: 100,
                      placeholderBuilder:
                          (context) => const Icon(
                            Icons.church,
                            size: 100,
                            color: AppColors.primary,
                          ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      '"I am the way, the truth, and the life.\nNo one comes to the Father except through Me."',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '- John 14:6',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, Map<String, dynamic> card) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          UrlService.openWebView(context, card['webUrl'], card['title']);
        },
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: card['backgroundColor'],
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
              ),
              child: Text(
                card['title'],
                style: TextStyle(
                  color: card['textColor'],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    card['description'],
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          UrlService.openWebView(
                            context,
                            card['webUrl'],
                            card['title'],
                          );
                        },
                        child: const Row(
                          children: [
                            Text('Learn More'),
                            SizedBox(width: 4),
                            Icon(Icons.arrow_forward, size: 16),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showWelcomeDialog(BuildContext context) {
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
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppAssets.logo,
                      width: 32,
                      height: 32,
                      placeholderBuilder:
                          (context) =>
                              const Icon(Icons.church, color: Colors.white),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Welcome to St. Mary Daily Prayer',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'We\'re glad you\'re here! St. Mary Daily Prayer is a vibrant Orthodox Christian app dedicated to bringing the word of God into your hearts and minds.',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Explore our resources to learn more about Jesus, Christianity, and your purpose in God\'s plan.',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            UrlService.openWebView(
                              context,
                              'https://www.copticchurch.net/newcomers',
                              'New to Orthodox Church',
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                          ),
                          child: const Text('Learn More'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Close'),
                        ),
                      ],
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
