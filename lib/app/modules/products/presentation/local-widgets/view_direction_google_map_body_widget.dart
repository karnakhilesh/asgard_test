import 'package:asgard/app/core/theme/colors.dart';
import 'package:asgard/app/modules/products/data/models/products_model.dart';
import 'package:asgard/app/modules/products/presentation/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ViewDirectionGoogleMapBodyWidget extends GetView<ProductController> {
  final ProductsModel product;
  const ViewDirectionGoogleMapBodyWidget(this.product, {super.key});

  @override
  Widget build(BuildContext context) => GoogleMap(
        initialCameraPosition: CameraPosition(
          target: controller.userLocation.value,
          zoom: 2,
        ),
        markers: {
          Marker(
            markerId: const MarkerId('source'),
            position: controller.userLocation.value,
          ),
          Marker(
            markerId: const MarkerId('destination'),
            position: LatLng(
              product.coordinates?[0] ?? 0,
              product.coordinates?[1] ?? 0,
            ),
          ),
        },
        polylines: {
          Polyline(
            polylineId: const PolylineId('route'),
            points: [
              controller.userLocation.value,
              LatLng(
                product.coordinates?[0] ?? 0,
                product.coordinates?[1] ?? 0,
              ),
            ],
            color: AppColors.primary900,
            width: 4,
          ),
        },
      );
}
