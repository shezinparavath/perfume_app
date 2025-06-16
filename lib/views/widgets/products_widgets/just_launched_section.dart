import 'package:flutter/material.dart';
import 'package:perfume_app/models/home_data_model/product.dart';
import 'package:perfume_app/views/widgets/common_widgets/product_card_widget.dart';

class JustLaunchedSection extends StatelessWidget {
  const JustLaunchedSection({super.key, required this.products});
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 10,
        children: List.generate(
          products.length,
          (index) => ProductCardWidget(product: products[index], index: index),
        ),
      ),
    );
  }
}
