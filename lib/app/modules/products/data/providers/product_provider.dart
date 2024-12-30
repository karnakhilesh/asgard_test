import 'package:asgard/app/modules/products/data/services/product_service.dart';

class ProductProvider {
  final ProductService _service;
  ProductProvider(this._service);

  Future<T?> getProducts<T>() async => _service.getProducts<T>();
}
