import 'package:asgard/app/core/theme/colors.dart';
import 'package:asgard/app/modules/products/data/models/products_model.dart';
import 'package:asgard/app/modules/products/presentation/controllers/product_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductDescriptionWidget extends GetView<ProductController> {
  final ProductsModel product;
  final int index;
  const ProductDescriptionWidget(this.product, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    /* return AsgardTypography(
      letterSpacing: 0,
      color: AppColors.dark80,
      text: product.body ?? "",
      variant: AsgardTypographyVariant.bodyMedium,
    ); */
    return Obx(
      () {
        final String txt = ((product.body ?? "").length <= 52)
            ? (product.body ?? "")
            : (controller.isExpandedList[index]
                ? (product.body ?? "")
                : "${(product.body ?? "").substring(0, 52)}...");
        final displayedText = txt.obs;
        return RichText(
          text: TextSpan(
            text: displayedText.value,
            style: TextStyle(
              letterSpacing: 0,
              color: AppColors.dark80,
              fontSize: 15.5.sp,
            ),
            children: !((product.body ?? "").length <= 52)
                ? [
                    TextSpan(
                      text: controller.isExpandedList[index]
                          ? ' See Less'
                          : ' See More',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          controller.isExpandedList[index] =
                              !controller.isExpandedList[index];
                        },
                      style: TextStyle(
                        letterSpacing: 0,
                        color: controller.isExpandedList[index]
                            ? AppColors.tertiary500
                            : AppColors.secondary500,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]
                : null,
          ),
        );
      },
    );
  }
}
