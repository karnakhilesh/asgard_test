import 'package:asgard/app/modules/products/presentation/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ProductsLocationsOnGoogleMapWidget extends GetView<ProductController> {
  const ProductsLocationsOnGoogleMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure products list are not empty
    if (controller.products.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: 200.h,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: controller.userLocation.value,
          zoom: 2,
        ),
        markers: controller.products
            .map(
              (product) => Marker(
                markerId: MarkerId((product.id ?? "").toString()),
                position: LatLng(
                  product.coordinates?[0] ?? 0,
                  product.coordinates?[1] ?? 0,
                ),
                infoWindow: InfoWindow(
                  title: product.title ?? "",
                  snippet: product.body ?? "",
                ),
              ),
            )
            .toSet(),
      ),
    );
  }
}
