class ProductsModel {
  String? imageUrl;
  List<double>? coordinates;
  String? id;
  String? title;
  String? body;
  String? userId;

  ProductsModel(
      {this.imageUrl,
      this.coordinates,
      this.id,
      this.title,
      this.body,
      this.userId});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'] ?? '';
    coordinates = json['coordinates'].cast<double>();
    id = json['id'] ?? '';
    title = json['title'] ?? '';
    body = json['body'] ?? '';
    userId = json['userId'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imageUrl'] = imageUrl;
    data['coordinates'] = coordinates;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    data['userId'] = userId;
    return data;
  }
}
