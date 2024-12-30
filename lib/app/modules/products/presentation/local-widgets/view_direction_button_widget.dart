import 'package:asgard/app/core/global-widgets/typography/typography.dart';
import 'package:asgard/app/core/routes/routes.dart';
import 'package:asgard/app/core/theme/colors.dart';
import 'package:asgard/app/core/utils/device_size_utils.dart';
import 'package:asgard/app/modules/products/data/models/products_model.dart';
import 'package:asgard/app/modules/products/presentation/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ViewDirectionButtonWidget extends GetView<ProductController> {
  final ProductsModel product;
  const ViewDirectionButtonWidget(this.product, {super.key});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          controller.product(product);
          Nav.pushNamed(Routes.directionView);
        },
        child: Container(
          width: ((deviceWidth) * (0.34)),
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.w),
          decoration: BoxDecoration(
            color: AppColors.primary900,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.directions,
                color: AppColors.white500,
                size: 14.w,
              ),
              SizedBox(width: 6.w),
              AsgardTypography(
                text: 'View Direction',
                color: AppColors.white500,
                letterSpacing: 0,
                variant: AsgardTypographyVariant.labelMedium,
              ),
            ],
          ),
        ),
      );
}
