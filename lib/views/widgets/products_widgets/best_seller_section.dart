import 'package:flutter/material.dart';
import 'package:perfume_app/views/widgets/common_widgets/product_card_widget.dart';

import '../../../models/home_data_model/product.dart';

class BestSellerSection extends StatelessWidget {
  const BestSellerSection({super.key, required this.bestSellers});
  final List<Product> bestSellers;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 10,
        children: List.generate(
          bestSellers.length,
          (index) =>
              ProductCardWidget(product: bestSellers[index], index: index),
        ),
      ),
    );
  }
}
