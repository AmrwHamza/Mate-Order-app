// ignore_for_file: prefer_collection_literals

class CartProductsModel {
  List<Data>? data;

  CartProductsModel({this.data});

  CartProductsModel.fromJson(Map<String, dynamic> json) {
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
  ProductInCart? productInCart;

  Data({this.productInCart});

  Data.fromJson(Map<String, dynamic> json) {
    productInCart = json['productInCart'] != null
        ? ProductInCart.fromJson(json['productInCart'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (productInCart != null) {
      data['productInCart'] = productInCart!.toJson();
    }
    return data;
  }
}

class ProductInCart {
  int? id;
  int? storeId;
  String? name;
  int? amount;
  int? price;
  String? category;
  int? active;
  String? imagePath;
  String? createdAt;
  String? updatedAt;
  int? totalAmount;

  ProductInCart(
      {this.id,
      this.storeId,
      this.name,
      this.amount,
      this.price,
      this.category,
      this.active,
      this.imagePath,
      this.createdAt,
      this.updatedAt,
      this.totalAmount});

  ProductInCart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storeId = json['store_id'];
    name = json['name'];
    amount = json['amount'];
    price = json['price'];
    category = json['category'];
    active = json['active'];
    imagePath = json['image_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    totalAmount = json['total_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['store_id'] = storeId;
    data['name'] = name;
    data['amount'] = amount;
    data['price'] = price;
    data['category'] = category;
    data['active'] = active;
    data['image_path'] = imagePath;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['total_amount'] = totalAmount;
    return data;
  }
}
