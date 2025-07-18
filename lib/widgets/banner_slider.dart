import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:dots_indicator/dots_indicator.dart';
import '../models/banner_item.dart';

class BannerSlider extends StatefulWidget {
  final List<BannerItem> banners;
  final double height;

  const BannerSlider({super.key, required this.banners, this.height = 200});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlutterCarousel(
          options: CarouselOptions(
            height: widget.height,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            autoPlay: true,
            showIndicator: false,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items:
              widget.banners.map((banner) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {
                        // Navigate to the banner's route
                        // Navigator.pushNamed(context, banner.route);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(banner.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withAlpha(
                                  179,
                                ), // Using withAlpha instead of withOpacity
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  banner.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (banner.subtitle != null)
                                  Text(
                                    banner.subtitle!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
        ),
        const SizedBox(height: 8),
        DotsIndicator(
          dotsCount: widget.banners.length,
          position: _currentIndex,
          decorator: DotsDecorator(
            size: const Size.square(8.0),
            activeSize: const Size(16.0, 8.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ],
    );
  }
}
