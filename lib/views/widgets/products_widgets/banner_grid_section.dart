import 'package:flutter/material.dart' hide Banner;
import 'package:perfume_app/contants/styles.dart';
import 'package:perfume_app/views/widgets/common_widgets/image_error_builder.dart';

import '../../../contants/colors.dart';
import '../../../models/home_data_model/banner.dart';

class BannerGridSection extends StatelessWidget {
  const BannerGridSection({super.key, required this.bannerGridItems});
  final List<Banner> bannerGridItems;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 10,
        children: bannerGridItems
            .map(
              (e) => ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(10),
                child: Stack(
                  alignment: const Alignment(0, 0.7),
                  children: [
                    Image.network(
                      e.image ?? '',
                      height: 230,
                      width: 165,
                      errorBuilder: (context, error, stackTrace) => ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(10),
                        child: const ImageErrorBuilder(height: 230, width: 165),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Shop Now',
                        style: AppStyles.fs12fw600(
                          color: AppColors.whiteTextColor,
                          underline: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
