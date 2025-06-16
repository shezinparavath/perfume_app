import 'package:flutter/material.dart' hide Banner;
import 'package:perfume_app/contants/constants.dart';
import 'package:provider/provider.dart';
import '../controllers/home_data_controller.dart';
import '../models/home_data_model/home_data_model.dart';
import '../models/home_data_model/product.dart';
import 'widgets/home_widgets/brand_section.dart';
import 'widgets/home_widgets/build_appbar.dart';
import 'widgets/home_widgets/carousel_section.dart';
import 'widgets/home_widgets/category_section.dart';
import 'widgets/home_widgets/create_rfq_section.dart';
import 'widgets/products_widgets/products_section.dart';
import 'widgets/common_widgets/section_header_widget.dart';
import '../models/home_data_model/home_field.dart';
import '../models/home_data_model/banner.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.token});
  final String token;

  Future<HomeDataModel> _loadHomeData() async {
    final controller = HomeDataController();
    return await controller.getHomeData(token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFEFAFA),
      appBar: buildAppbar(context),
      body: FutureBuilder<HomeDataModel>(
        future: _loadHomeData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data?.data == null) {
            return const Center(child: Text('No data found'));
          }
          final fields = snapshot.data!.data!.homeFields ?? [];
          final carouselItems =
              _filterByType(fields, AppConstants.kCarousel).carouselItems ?? [];
          final brandItems =
              _filterByType(fields, AppConstants.kBrands).brands ?? [];
          final categoryItems =
              _filterByType(fields, AppConstants.kCategory).categories ?? [];
          final bannerItems = _filterByType(
            fields,
            AppConstants.kBanner,
          ).banner;
          final rfqImages = _filterByType(fields, AppConstants.kRFQ).image;
          final futureProductImages = _filterByType(
            fields,
            AppConstants.kFutureOrder,
          ).image;
          final bannerGridItems =
              _filterByType(fields, AppConstants.kBannerGrid).banners ?? [];
          final justLaunched = _filterCollection(fields, 1);
          final featured = _filterCollection(fields, 2);
          final bestSellers = _filterCollection(fields, 3);
          final List<Product> mergedData = [
            ...featured.products ?? [],
            ...justLaunched.products ?? [],
            ...bestSellers.products ?? [],
          ];
          WidgetsBinding.instance.addPostFrameCallback(
            (timeStamp) => Provider.of<HomeDataController>(
              context,
              listen: false,
            ).initailizeProducts(mergedData),
          );
          return Padding(
            padding: const EdgeInsets.all(15),
            child: ListView(
              children: [
                CarouselSection(
                  items: carouselItems.map((e) => e.image ?? '').toList(),
                ),
                const SectionHeaderWidget(label: 'Shop By Brand'),
                BrandSection(items: brandItems),
                const SectionHeaderWidget(label: 'Our Categories'),
                CategorySection(categories: categoryItems),
                const SizedBox(height: 15),
                CreateRfqSection(image: rfqImages ?? ''),
                SectionHeaderWidget(
                  label: _filterCollection(fields, 1).name ?? '',
                ),
                ProductsSection(
                  justLaunchedItems: justLaunched,
                  futureProduct: futureProductImages ?? '',
                  banner: bannerItems ?? Banner(),
                  bannerGridItems: bannerGridItems,
                  bestSellers: bestSellers,
                  featuredProducts: featured,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  HomeField _filterByType(List<HomeField> fields, String type) {
    return fields.firstWhere((e) => e.type == type, orElse: () => HomeField());
  }

  HomeField _filterCollection(List<HomeField> fields, int collectionId) {
    return fields.firstWhere(
      (e) =>
          e.type == AppConstants.kCollection && e.collectionId == collectionId,
      orElse: () => HomeField(),
    );
  }
}
