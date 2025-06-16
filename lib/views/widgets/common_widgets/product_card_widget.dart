import 'package:flutter/material.dart';
import 'package:perfume_app/contants/colors.dart';
import 'package:perfume_app/contants/styles.dart';
import 'package:perfume_app/controllers/home_data_controller.dart';
import 'package:perfume_app/models/home_data_model/product.dart';
import 'package:perfume_app/views/widgets/common_widgets/image_error_builder.dart';
import 'package:provider/provider.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    super.key,
    required this.product,
    required this.index,
  });
  final Product product;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.whiteTextColor,
            border: Border.all(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(12),
          ),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.43,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<HomeDataController>(
                builder: (context, homeDataController, child) {
                  final product = homeDataController.products.firstWhere(
                    (p) => p.id == this.product.id,
                  );
                  return Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        homeDataController.toggleWishlistById(product.id ?? 0);
                      },
                      child: Icon(
                        (product.wishlisted ?? false)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: AppColors.redColor,
                      ),
                    ),
                  );
                },
              ),
              Center(
                child: Image.network(
                  product.image ?? '',
                  height: 109,
                  width: 90,
                  errorBuilder: (context, error, stackTrace) =>
                      const ImageErrorBuilder(height: 109, width: 90),
                ),
              ),
              Center(
                child: Text(
                  product.name ?? '',
                  style: AppStyles.fs13fw600(),
                  softWrap: true,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    decorationColor: AppColors.greyTextColor,
                  ),
                  children: [
                    TextSpan(
                      text: product.currency,
                      style: AppStyles.fs11fw400(
                        color: AppColors.greyTextColor,
                      ),
                    ),
                    TextSpan(
                      text: product.actualPrice,
                      style: AppStyles.fs13fw600(
                        color: AppColors.greyTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                spacing: 5,
                children: [
                  RichText(
                    text: TextSpan(
                      text: product.currency,
                      style: AppStyles.fs11fw400(
                        color: AppColors.primaryBlackTextColor,
                      ),
                      children: [
                        TextSpan(
                          text: product.price,
                          style: AppStyles.fs13fw600(
                            color: AppColors.primaryBlackTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(product.unit ?? '', style: AppStyles.fs10fw500),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                spacing: 10,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      elevation: 0,
                      minimumSize: const Size(30, 34),
                      backgroundColor: AppColors.whiteTextColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(30),
                        side: const BorderSide(color: AppColors.borderColor),
                      ),
                    ),
                    child: Text(
                      'RFQ',
                      style: AppStyles.fs13fw600(
                        color: AppColors.secondaryBlackTextColor,
                      ),
                    ),
                  ),

                  Consumer<HomeDataController>(
                    builder: (context, homeDataController, child) {
                      final product = homeDataController.products.firstWhere(
                        (p) => p.id == this.product.id,
                      );
                      return (product.cartCount ?? 0) > 0
                          ? Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: AppColors.redColor,
                              ),
                              child: Row(
                                spacing: 5,
                                children: [
                                  GestureDetector(
                                    onTap: () => homeDataController
                                        .toggleCartSubtractById(
                                          product.id ?? 0,
                                        ),
                                    child: const Icon(
                                      Icons.remove,
                                      color: AppColors.whiteTextColor,
                                      size: 16,
                                    ),
                                  ),
                                  Text(
                                    product.cartCount.toString(),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.whiteTextColor,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => homeDataController
                                        .toggleCartAddingById(product.id ?? 0),
                                    child: const Icon(
                                      Icons.add,
                                      color: AppColors.whiteTextColor,
                                      size: 16,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  homeDataController.toggleCartAddingById(
                                    product.id ?? 0,
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  elevation: 0,
                                  minimumSize: const Size(30, 34),
                                  backgroundColor: AppColors.redColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      30,
                                    ),
                                    side: const BorderSide(
                                      color: AppColors.borderColor,
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  'Add to cart',
                                  style: TextStyle(
                                    color: AppColors.whiteTextColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        if (product.offer != null && product.offer!.isNotEmpty)
          Positioned(
            left: -0.85,
            top: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: const BoxDecoration(
                color: Color(0xffF5F5F5),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Text(
                product.offer!,
                style: AppStyles.fs12fw600(color: AppColors.offerTextColor),
              ),
            ),
          ),
      ],
    );
  }
}
