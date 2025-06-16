import 'package:flutter/material.dart';
import '../../../contants/colors.dart';
import '../../../models/home_data_model/brand.dart';
import '../common_widgets/image_error_builder.dart';

class BrandSection extends StatelessWidget {
  const BrandSection({super.key, required this.items});
  final List<Brand> items;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 10,
        children: items
            .map(
              (e) => Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.borderColor),
                ),
                child: Image.network(
                  e.image ?? '',
                  width: 100,
                  height: 100,
                  errorBuilder: (context, error, stackTrace) =>
                      const ImageErrorBuilder(height: 100, width: 100),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
