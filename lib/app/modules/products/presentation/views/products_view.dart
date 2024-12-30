import 'package:asgard/app/core/global-widgets/typography/typography.dart';
import 'package:asgard/app/core/theme/colors.dart';
import 'package:asgard/app/modules/products/presentation/controllers/product_controller.dart';
import 'package:asgard/app/modules/products/presentation/local-widgets/local_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsView extends GetView<ProductController> {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.white500,
        appBar: AppBar(
          backgroundColor: AppColors.primary500,
          centerTitle: true,
          title: AsgardTypography(
            text: 'asg_productsStr'.tr,
            letterSpacing: 0.5,
            textAlign: TextAlign.center,
            color: AppColors.white500,
            fontWeight: FontWeight.normal,
            variant: AsgardTypographyVariant.headlineSmall,
          ),
        ),
        body: Obx(
          () => RefreshIndicator(
            onRefresh: controller.onReady,
            child: (controller.isProductLoading.value)
                ? const Center(child: CircularProgressIndicator())
                : (controller.errorMessage.isNotEmpty)
                    ? NoProductErrorWidget(controller.errorMessage.value)
                    : ProductListViewBodyWidget(),
          ),
        ),
      );
}
