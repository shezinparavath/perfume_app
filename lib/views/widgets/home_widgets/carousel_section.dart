import 'package:flutter/material.dart';
import 'package:animated_cross_fade_plus/animated_cross_fade_plus.dart';

import '../common_widgets/image_error_builder.dart';

class CarouselSection extends StatelessWidget {
  const CarouselSection({super.key, required this.items});
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFadePlus(
      autoPlay: true,
      transitionType: CrossFadeTransitionType.fade,
      autoPlayDuration: const Duration(seconds: 3),
      children: items
          .map(
            (e) => ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(10),
              child: Image.network(
                e,
                errorBuilder: (context, error, stackTrace) => ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(10),
                  child: const ImageErrorBuilder(height: 150, width: double.infinity),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
