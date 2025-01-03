import 'package:mate_order_app/Features/Home/Products/data/models/products_with_category_model/products_with_category/products_with_category.dart';

class CartProductsModel {
  List<Product>? data;

  CartProductsModel({this.data});

  CartProductsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Product>[];
      json['data'].forEach((v) {
        data!.add(Product.fromJson(v));
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



// class Data {
//   int? id;
//   int? storeId;
//   String? name;
//   int? amount;
//   int? price;
//   String? category;
//   int? active;
//   String? imagePath;
//   String? createdAt;
//   String? updatedAt;

//   Data(
//       {this.id,
//       this.storeId,
//       this.name,
//       this.amount,
//       this.price,
//       this.category,
//       this.active,
//       this.imagePath,
//       this.createdAt,
//       this.updatedAt});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     storeId = json['store_id'];
//     name = json['name'];
//     amount = json['amount'];
//     price = json['price'];
//     category = json['category'];
//     active = json['active'];
//     imagePath = json['image_path'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['store_id'] = this.storeId;
//     data['name'] = this.name;
//     data['amount'] = this.amount;
//     data['price'] = this.price;
//     data['category'] = this.category;
//     data['active'] = this.active;
//     data['image_path'] = this.imagePath;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
