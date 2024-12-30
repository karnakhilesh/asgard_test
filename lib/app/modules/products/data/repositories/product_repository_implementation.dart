import 'package:asgard/app/core/errors/errors.dart';
import 'package:asgard/app/modules/products/data/models/products_model.dart';
import 'package:asgard/app/modules/products/data/providers/product_provider.dart';
import 'package:asgard/app/modules/products/domain/repositories/product_repository_interface.dart';

class ProductRepositoryImplementation implements ProductRepositoryInterface {
  final ProductProvider _provider;
  ProductRepositoryImplementation(this._provider);

  @override
  Future<List<ProductsModel>> getProducts() async {
    final rawData = await _provider.getProducts();

    if (rawData != null && rawData is List) {
      return rawData
          .map((e) => ProductsModel.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw NullDataException("Could not fetch products.");
  }
}
