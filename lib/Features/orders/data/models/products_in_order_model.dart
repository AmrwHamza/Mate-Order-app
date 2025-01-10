// ignore_for_file: prefer_collection_literals

class ProductsInOrderModel {
  List<Data>? data;

  ProductsInOrderModel({this.data});

  ProductsInOrderModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  ProductInCart? productInCart;
  String? store;
  int? totalAmount;
  String? totalPrice;

  Data({this.productInCart, this.store, this.totalAmount, this.totalPrice});

  Data.fromJson(Map<String, dynamic> json) {
    productInCart = json['productInCart'] != null
        ? ProductInCart.fromJson(json['productInCart'])
        : null;
    store = json['store'];
    totalAmount = json['total_amount'];
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (productInCart != null) {
      data['productInCart'] = productInCart!.toJson();
    }
    data['store'] = store;
    data['total_amount'] = totalAmount;
    data['total_price'] = totalPrice;
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
      this.updatedAt});

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
    return data;
  }
}
