import 'package:asgard/app/core/services/services.dart';
import 'package:asgard/app/modules/products/data/providers/product_provider.dart';
import 'package:asgard/app/modules/products/data/repositories/product_repository_implementation.dart';
import 'package:asgard/app/modules/products/data/services/product_service.dart';
import 'package:asgard/app/modules/products/domain/repositories/product_repository_interface.dart';
import 'package:asgard/app/modules/products/presentation/controllers/product_controller.dart';
import 'package:get/get.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AsgardApiService>(() => AsgardApiService());
    Get.lazyPut<ProductService>(() => ProductService(Get.find()));
    Get.lazyPut<ProductProvider>(() => ProductProvider(Get.find()));
    Get.lazyPut<ProductRepositoryInterface>(
        () => ProductRepositoryImplementation(Get.find()));
    Get.lazyPut<ProductController>(() => ProductController(Get.find()));
  }
}
