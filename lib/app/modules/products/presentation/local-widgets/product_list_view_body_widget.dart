import 'package:asgard/app/core/theme/colors.dart';
import 'package:asgard/app/modules/products/presentation/controllers/product_controller.dart';
import 'package:asgard/app/modules/products/presentation/local-widgets/local_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductListViewBodyWidget extends GetView<ProductController> {
  const ProductListViewBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure products is not empty and valid
    if (controller.products.isEmpty) {
      return NoProductErrorWidget('asg_somethingWentWrongStr'.tr);
    }

    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.all(16.w),
            physics: AlwaysScrollableScrollPhysics(),
            itemCount: controller.products.length,
            separatorBuilder: (_, __) => SizedBox(height: 16.h),
            itemBuilder: (context, index) {
              final product = controller.products[index];

              return DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.white500,
                  borderRadius: BorderRadius.circular(16.w),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.4),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(6.w),
                  child: Row(
                    children: [
                      ProductImageWidget(product),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ProductTitleWidget(product),
                                ViewDirectionButtonWidget(product),
                              ],
                            ),
                            SizedBox(height: 4.h),
                            ProductDescriptionWidget(product, index),
                            SizedBox(height: 4.h),
                            ProductDistanceWidget(product),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        ProductsLocationsOnGoogleMapWidget(),
      ],
    );
  }
}
