import 'package:asgard/app/core/global-widgets/typography/typography.dart';
import 'package:asgard/app/core/theme/colors.dart';
import 'package:asgard/app/core/utils/device_size_utils.dart';
import 'package:asgard/app/modules/products/presentation/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NoProductErrorWidget extends GetView<ProductController> {
  final String msg;
  const NoProductErrorWidget(this.msg, {super.key});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        padding: EdgeInsets.zero,
        physics: AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          height: ((deviceHeight) / 1.3),
          width: double.maxFinite,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ErrorText(
                    msg.isNotEmpty ? msg : 'asg_somethingWentWrongStr'.tr),
                SizedBox(height: 24.h),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary900,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  onPressed: controller.onReady,
                  child: AsgardTypography(
                    text: 'asg_tryAgainStr'.tr,
                    color: AppColors.white500,
                    letterSpacing: 0,
                    variant: AsgardTypographyVariant.labelMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class ErrorText extends StatelessWidget {
  final String msg;
  const ErrorText(this.msg, {super.key});

  @override
  Widget build(BuildContext context) => AsgardTypography(
        text: msg,
        fontSize: 20.sp,
        letterSpacing: 0.5,
        fontWeight: FontWeight.w600,
        textAlign: TextAlign.center,
        color: AppColors.secondary500,
      );
}
