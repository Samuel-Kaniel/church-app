import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/constants.dart';
import '../widgets/info_card.dart';

class ForYouScreen extends StatelessWidget {
  const ForYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Define info cards
    final List<Map<String, String>> infoCards = [
      {'title': AppStrings.whoIsJesus, 'imageUrl': AppAssets.banner2},
      {'title': AppStrings.whatIsChristianity, 'imageUrl': AppAssets.banner1},
      {'title': AppStrings.whatIsMyIdentity, 'imageUrl': AppAssets.banner2},
      {'title': AppStrings.whatIsMyPurpose, 'imageUrl': AppAssets.banner1},
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
            // Banner image
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.banner2),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withAlpha(179)],
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "I'm New",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Info cards
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children:
                    infoCards.map((card) {
                      return InfoCard(
                        title: card['title']!,
                        imageUrl: card['imageUrl']!,
                        onTap: () {
                          // Navigate to the info card's detail page
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('${card['title']} tapped')),
                          );
                        },
                      );
                    }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
