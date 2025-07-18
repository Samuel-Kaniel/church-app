import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/constants.dart';
import '../widgets/contact_button.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            // Church image
            Container(
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
                    colors: [Colors.transparent, Colors.black.withOpacity(0.5)],
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
                    () {},
                  ),
                  _buildContactGridItem(
                    context,
                    AppStrings.shop,
                    Icons.shopping_bag,
                    () {},
                  ),
                  _buildContactGridItem(
                    context,
                    AppStrings.instagram,
                    Icons.camera_alt,
                    () {},
                  ),
                  _buildContactGridItem(
                    context,
                    AppStrings.facebook,
                    Icons.facebook,
                    () {},
                  ),
                  _buildContactGridItem(
                    context,
                    AppStrings.website,
                    Icons.language,
                    () {},
                  ),
                  _buildContactGridItem(
                    context,
                    AppStrings.contactUs,
                    Icons.email,
                    () {},
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
                  const Text('About Us', style: AppTextStyles.heading1),
                  const SizedBox(height: 8),
                  const Text(
                    'Upper Room is a vibrant Orthodox Christian Church. Its mission is to bring the word of God from a timeless faith into your hearts and minds anywhere at anytime.',
                    style: AppTextStyles.body,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'The Orthodox Church worships God in continuity with the ancient Church, and is said to be the oldest Church. It is a balance between spirituality and theology, between the worship of God and service to humanity. Everything in Orthodoxy is a balance between spirituality and theology, between the worship of God and service to humanity.',
                    style: AppTextStyles.body,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'The Orthodox Church worships God in spirit and in truth (John 4:24) and intentionally incarnates that truth in every age among all peoples of all walks of life to love God, others, and themselves.',
                    style: AppTextStyles.body,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Contact us for more information:',
                    style: AppTextStyles.body,
                  ),
                  const SizedBox(height: 8),
                  ContactButton(
                    title: 'Email Us',
                    icon: Icons.email,
                    onTap: () {},
                  ),
                  ContactButton(
                    title: 'Call Us',
                    icon: Icons.phone,
                    onTap: () {},
                  ),
                  ContactButton(
                    title: 'Visit Us',
                    icon: Icons.location_on,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
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
}
