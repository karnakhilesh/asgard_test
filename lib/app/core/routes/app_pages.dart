import 'package:asgard/app/modules/products/presentation/bindings/product_binding.dart';
import 'package:asgard/app/modules/products/presentation/views/products_view.dart';
import 'package:asgard/app/modules/products/presentation/views/view_direction_screen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.productsView;

  static final routes = [
    GetPage(
      name: _Paths.productsView,
      page: () => const ProductsView(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: _Paths.directionView,
      page: () => const ViewDirectionScreen(),
      binding: ProductBinding(),
      maintainState: false,
    ),
  ];
}
