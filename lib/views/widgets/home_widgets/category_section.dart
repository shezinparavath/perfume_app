import 'dart:math';

import 'package:flutter/material.dart';
import 'package:perfume_app/contants/colors.dart';
import 'package:perfume_app/contants/constants.dart';
import 'package:perfume_app/contants/styles.dart';
import 'package:perfume_app/models/home_data_model/category.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key, required this.categories});
  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: GridView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final random = Random();
          final categoryColor =
              AppColors.categoryRandomColor[random.nextInt(
                AppColors.categoryRandomColor.length,
              )];
          final category = categories[index];
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: categoryColor,
                ),
                child: Image.network(
                  category.image ?? '',
                  errorBuilder: (context, error, stackTrace) =>
                      Image.asset(AppAssets.errorImage),
                ),
              ),
              Text(
                category.name ?? '',
                overflow: TextOverflow.ellipsis,
                style: AppStyles.categoryTextStyle,
              ),
            ],
          );
        },
      ),
    );
  }
}
