import 'package:flutter/material.dart';
import 'package:perfume_app/contants/colors.dart';
import 'package:perfume_app/contants/styles.dart';
import 'package:perfume_app/views/widgets/common_widgets/image_error_builder.dart';

class CreateRfqSection extends StatelessWidget {
  const CreateRfqSection({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(10),
          child: Image.network(
            image,
            errorBuilder: (context, error, stackTrace) =>
                const ImageErrorBuilder(height: 150, width: double.infinity),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15,

            children: [
              Text(
                'Request For Quote',
                style: AppStyles.headerTextStyle(
                  color: AppColors.lightBlackTextColor,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlackTextColor,
                  elevation: 0,
                ),
                child: const Text(
                  'Create RFQ',
                  style: TextStyle(
                    color: AppColors.whiteTextColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
