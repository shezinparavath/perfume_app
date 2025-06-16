import 'package:flutter/material.dart';
import 'package:perfume_app/views/widgets/common_widgets/product_card_widget.dart';

import '../../../models/home_data_model/product.dart';

class FeaturedProducts extends StatelessWidget {
  const FeaturedProducts({super.key, required this.featuredProducts});
  final List<Product> featuredProducts;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 10,
        children: List.generate(
          featuredProducts.length,
          (index) =>
              ProductCardWidget(product: featuredProducts[index], index: index),
        ),
      ),
    );
  }
}
