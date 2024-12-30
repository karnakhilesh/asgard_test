// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:math';

import 'package:asgard/app/modules/products/data/models/products_model.dart';
import 'package:asgard/app/modules/products/domain/repositories/product_repository_interface.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart' as ph;

class ProductController extends GetxController {
  final ProductRepositoryInterface _repository;

  ProductController(this._repository);

  final isProductLoading = true.obs;
  final products = <ProductsModel>[].obs;
  final product = Rxn<ProductsModel>();
  final userLocation = const LatLng(0.0, 0.0).obs;
  final errorMessage = ''.obs;
  final isConnected = false.obs;

  // List to track expanded state of each item
  final isExpandedList = <bool>[].obs;

  @override
  void onInit() {
    super.onInit();
    if (!isProductLoading.value) isProductLoading(true);
    _checkConnectivity();
    Connectivity().onConnectivityChanged.listen((result) {
      _updateConnectionStatus(result);
    });
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    if (!isProductLoading.value) isProductLoading(true);
    await _checkConnectivity();
  }

  Future<void> _checkConnectivity() async {
    if (!isProductLoading.value) isProductLoading(true);
    final result = await Connectivity().checkConnectivity();
    await _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    if (!isProductLoading.value) isProductLoading(true);
    if (result.isNotEmpty) {
      isConnected(result.first != ConnectivityResult.none);

      if (isConnected.value) {
        await getUserLocation();
      } else {
        errorMessage('asg_networkExceptionMessageStr'.tr);
        isProductLoading(false);
      }
    } else {
      isConnected(false);
      isProductLoading(false);
    }
  }

  Future<void> getUserLocation() async {
    try {
      if (!isProductLoading.value) isProductLoading(true);
      Location location = Location();
      bool _serviceEnabled = await location.serviceEnabled();

      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();

        if (!_serviceEnabled) {
          errorMessage('asg_makeSureLocationTurnedOnStr'.tr);
          isProductLoading(false);
        } else {
          await checkPermission(location);
        }
      } else {
        await checkPermission(location);
      }
    } catch (e) {
      errorMessage('${"asg_errorFetchingLocationStr".tr}: $e');
      isProductLoading(false);
    }
  }

  Future<void> checkPermission(Location location) async {
    try {
      if (!isProductLoading.value) isProductLoading(true);
      PermissionStatus _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();

        if (_permissionGranted != PermissionStatus.granted) {
          final statusDenied =
              ((_permissionGranted == PermissionStatus.denied) ||
                  (_permissionGranted == PermissionStatus.deniedForever));
          if (statusDenied) await ph.openAppSettings();

          final status = await location.hasPermission();
          if (status == PermissionStatus.granted) {
            await _getLocation(location);
          } else {
            errorMessage('asg_needToAllowLocationStr'.tr);
            isProductLoading(false);
          }
        } else {
          await _getLocation(location);
        }
      } else {
        await _getLocation(location);
      }
    } catch (e) {
      errorMessage('${"asg_errorFetchingLocationStr".tr}: $e');
      isProductLoading(false);
    }
  }

  Future<void> _getLocation(Location location) async {
    try {
      if (!isProductLoading.value) isProductLoading(true);
      LocationData _locationData = await location.getLocation();

      if (_locationData.latitude != null && _locationData.longitude != null) {
        userLocation(LatLng(_locationData.latitude!, _locationData.longitude!));
        await fetchProducts();
      } else {
        isProductLoading(false);
      }
    } catch (e) {
      errorMessage('${"asg_errorFetchingLocationStr".tr}: $e');
      isProductLoading(false);
    }
  }

  Future<void> fetchProducts() async {
    try {
      if (!isProductLoading.value) isProductLoading(true);

      final res = await _repository.getProducts();

      if (res.isNotEmpty) {
        errorMessage('');
        for (var _ in res) {
          isExpandedList.add(false);
        }
        products(res);
      } else {
        errorMessage('Failed to load products');
      }
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isProductLoading(false);
    }
  }

  double calculateDistance(LatLng start, LatLng end) {
    const double R = 6371; // Radius of the Earth in km
    final double latDistance = _degToRad(end.latitude - start.latitude);
    final double lonDistance = _degToRad(end.longitude - start.longitude);
    final double a = (sin(latDistance / 2) * sin(latDistance / 2)) +
        cos(_degToRad(start.latitude)) *
            cos(_degToRad(end.latitude)) *
            sin(lonDistance / 2) *
            sin(lonDistance / 2);
    final double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return R * c;
  }

  double _degToRad(double degree) => degree * pi / 180;
}
