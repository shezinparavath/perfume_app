import 'package:flutter/material.dart' hide Banner;
import 'package:perfume_app/models/home_data_model/home_field.dart';
import 'package:perfume_app/views/widgets/common_widgets/image_error_builder.dart';
import '../../../models/home_data_model/banner.dart';
import '../common_widgets/section_header_widget.dart';
import 'banner_grid_section.dart';
import 'best_seller_section.dart';
import 'featured_products.dart';
import 'just_launched_section.dart';

class ProductsSection extends StatelessWidget {
  const ProductsSection({
    super.key,
    required this.justLaunchedItems,
    required this.futureProduct,
    required this.bannerGridItems,
    required this.featuredProducts,
    required this.banner,
    required this.bestSellers,
  });
  final HomeField justLaunchedItems;
  final String futureProduct;
  final List<Banner> bannerGridItems;
  final HomeField featuredProducts;
  final Banner banner;
  final HomeField bestSellers;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        JustLaunchedSection(products: justLaunchedItems.products ?? []),
        const SizedBox(height: 15),

        /// FutureProductSection
        // const SizedBox(height: 15)
        // Image.network(
        //   futureProduct,
        //   errorBuilder: (context, error, stackTrace) =>
        //       ImageErrorBuilder(height: 150, width: double.infinity),
        // ),
        // const SizedBox(height: 15)
        BannerGridSection(bannerGridItems: bannerGridItems),
        SectionHeaderWidget(label: featuredProducts.name ?? ''),
        FeaturedProducts(featuredProducts: featuredProducts.products ?? []),
        const SizedBox(height: 15),
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(10),
          child: Image.network(
            banner.image ?? '',
            errorBuilder: (context, error, stackTrace) =>
                const ImageErrorBuilder(height: 150, width: double.infinity),
          ),
        ),
        SectionHeaderWidget(label: bestSellers.name ?? ''),
        BestSellerSection(bestSellers: bestSellers.products ?? []),
      ],
    );
  }
}
