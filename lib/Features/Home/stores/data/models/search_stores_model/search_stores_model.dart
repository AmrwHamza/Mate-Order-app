import 'package:mate_order_app/Features/Home/stores/data/models/stores_model/store.dart';

import '../stores_model/data.dart';

class SearchStoresModel {
  List<Store>? stores;

  SearchStoresModel({this.stores});

  SearchStoresModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      stores = <Store>[];
      json['data'].forEach((v) {
        stores!.add(new Store.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.stores != null) {
      data['data'] = this.stores!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
