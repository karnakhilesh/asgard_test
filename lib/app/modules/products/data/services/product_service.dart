import 'package:asgard/app/core/constants/api_end_points.dart';
import 'package:asgard/app/core/services/services.dart';

class ProductService {
  final AsgardApiService _apiService;

  ProductService(this._apiService);

  Future<T?> getProducts<T>() async {
    final request = AsgardRequest(
      apiPath: ApiEndPoint.getProducts,
      isAuthorizationRequired: false,
    );

    return _apiService.getRequest<T>(request);
  }
}
