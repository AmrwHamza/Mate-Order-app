class CartProductsModel {
  List<Data>? data;

  CartProductsModel({this.data});

  CartProductsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
        ? new ProductInCart.fromJson(json['productInCart'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productInCart != null) {
      data['productInCart'] = this.productInCart!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['store_id'] = this.storeId;
    data['name'] = this.name;
    data['amount'] = this.amount;
    data['price'] = this.price;
    data['category'] = this.category;
    data['active'] = this.active;
    data['image_path'] = this.imagePath;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['total_amount'] = this.totalAmount;
    return data;
  }
}
