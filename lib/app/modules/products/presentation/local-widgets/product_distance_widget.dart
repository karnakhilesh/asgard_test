import 'package:asgard/app/core/global-widgets/typography/typography.dart';
import 'package:asgard/app/core/theme/colors.dart';
import 'package:asgard/app/core/utils/currency_utils.dart';
import 'package:asgard/app/modules/products/data/models/products_model.dart';
import 'package:asgard/app/modules/products/presentation/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ProductDistanceWidget extends GetView<ProductController> {
  final ProductsModel product;
  const ProductDistanceWidget(this.product, {super.key});

  @override
  Widget build(BuildContext context) => AsgardTypography(
        text: 'Distance: ${CurrencyUtils.getBalance(
          controller.calculateDistance(
            controller.userLocation.value,
            LatLng(product.coordinates?[0] ?? 0, product.coordinates?[1] ?? 0),
          ),
          hasBalance: false,
        )} km',
        color: AppColors.gray600,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
        variant: AsgardTypographyVariant.bodySmall,
      );
}
