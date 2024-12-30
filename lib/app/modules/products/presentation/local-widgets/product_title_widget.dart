import 'package:asgard/app/core/global-widgets/typography/typography.dart';
import 'package:asgard/app/modules/products/data/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductTitleWidget extends StatelessWidget {
  final ProductsModel product;
  const ProductTitleWidget(this.product, {super.key});

  @override
  Widget build(BuildContext context) => AsgardTypography(
        text: ((product.title ?? "").toString()).capitalize ?? '',
        fontWeight: FontWeight.bold,
        letterSpacing: 0.5,
        variant: AsgardTypographyVariant.bodyLarge,
      );
}
