import 'package:asgard/app/modules/products/data/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImageWidget extends StatelessWidget {
  final ProductsModel product;
  const ProductImageWidget(this.product, {super.key});

  @override
  Widget build(BuildContext context) => CircleAvatar(
        radius: 38.r,
        backgroundImage: NetworkImage(
          (product.imageUrl ?? "https://via.placeholder.com/150"),
        ),
      );
}
