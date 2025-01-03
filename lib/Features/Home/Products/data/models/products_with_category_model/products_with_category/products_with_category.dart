// ignore_for_file: prefer_collection_literals

class ProductsWithCategoryModel {
  List<Data>? data;
  Pagination? pagination;

  ProductsWithCategoryModel({this.data, this.pagination});

  ProductsWithCategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  int? storeId;
  String? name;
  int? amount;
  dynamic price;
  String? category;
  String? imagePath;
  String? createdAt;
  String? updatedAt;
  int? active;
  String? owner;
  bool? fav;

  Product(
      {this.id,
      this.storeId,
      this.name,
      this.amount,
      this.price,
      this.category,
      this.imagePath,
      this.createdAt,
      this.updatedAt,
      this.active,
      this.owner,
      this.fav});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storeId = json['store_id'];
    name = json['name'];
    amount = json['amount'];
    price = json['price'];
    category = json['category'];
    imagePath = json['image_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    active = json['active'];
    owner = json['owner'];
    fav = json['fav'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['store_id'] = storeId;
    data['name'] = name;
    data['amount'] = amount;
    data['price'] = price;
    data['category'] = category;
    data['image_path'] = imagePath;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['active'] = active;
    data['owner'] = owner;
    data['fav'] = fav;
    return data;
  }
}

class Pagination {
  int? currentPage;
  int? lastPage;
  int? total;
  int? perPage;
  String? nextPageUrl;
  String? prevPageUrl;

  Pagination(
      {this.currentPage,
      this.lastPage,
      this.total,
      this.perPage,
      this.nextPageUrl,
      this.prevPageUrl});

  Pagination.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    lastPage = json['last_page'];
    total = json['total'];
    perPage = json['per_page'];
    nextPageUrl = json['next_page_url'];
    prevPageUrl = json['prev_page_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['current_page'] = currentPage;
    data['last_page'] = lastPage;
    data['total'] = total;
    data['per_page'] = perPage;
    data['next_page_url'] = nextPageUrl;
    data['prev_page_url'] = prevPageUrl;
    return data;
  }
}
