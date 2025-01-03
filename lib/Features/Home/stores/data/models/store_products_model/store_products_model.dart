import '../../../../Products/data/models/products_with_category_model/products_with_category/products_with_category.dart';

class StoreProductsModel {
  List<Data>? data;
  Pagination? pagination;

  StoreProductsModel({this.data, this.pagination});

  StoreProductsModel.fromJson(Map<String, dynamic> json) {
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
    // ignore: prefer_collection_literals
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
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (product != null) {
      data['product'] = product!.toJson();
    }
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
    // ignore: prefer_collection_literals
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
