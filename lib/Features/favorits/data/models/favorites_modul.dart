import '../../../Home/Products/data/models/products_with_category_model/products_with_category/products_with_category.dart';

class FavoritsModul {
  List<Data>? data;

  FavoritsModul({this.data});

  FavoritsModul.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  Product? product;

  Data({this.product});

  Data.fromJson(Map<String, dynamic> json) {
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}
