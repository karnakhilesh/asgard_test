import 'package:asgard/app/core/errors/errors.dart';
import 'package:asgard/app/core/global-widgets/typography/typography.dart';
import 'package:asgard/app/core/routes/routes.dart';
import 'package:asgard/app/core/theme/colors.dart';
import 'package:asgard/app/modules/products/presentation/controllers/product_controller.dart';
import 'package:asgard/app/modules/products/presentation/local-widgets/local_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewDirectionScreen extends GetView<ProductController> {
  const ViewDirectionScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.white500,
        appBar: AppBar(
          backgroundColor: AppColors.primary500,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_sharp),
            color: AppColors.white500,
            onPressed: Nav.pop,
          ),
          centerTitle: true,
          title: AsgardTypography(
            text: 'asg_viewDirectionsStr'.tr,
            letterSpacing: 0.5,
            textAlign: TextAlign.center,
            color: AppColors.white500,
            fontWeight: FontWeight.normal,
            variant: AsgardTypographyVariant.headlineSmall,
          ),
        ),
        body: Obx(
          () {
            if (controller.product.value == null) {
              return Center(child: Text(internalErrorExceptionMessage));
            } else {
              return ViewDirectionGoogleMapBodyWidget(
                  controller.product.value!);
            }
          },
        ),
      );
}
