import 'package:flutter/material.dart';
import 'package:perfume_app/contants/styles.dart';

class SectionHeaderWidget extends StatelessWidget {
  const SectionHeaderWidget({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppStyles.headerTextStyle()),
          Text('View All', style: AppStyles.viewAllTextStyle(underLine: true)),
        ],
      ),
    );
  }
}
