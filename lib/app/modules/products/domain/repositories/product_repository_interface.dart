import 'package:asgard/app/modules/products/data/models/products_model.dart';

abstract class ProductRepositoryInterface {
  Future<List<ProductsModel>> getProducts();
}
