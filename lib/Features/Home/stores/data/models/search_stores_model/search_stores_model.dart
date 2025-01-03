import 'package:mate_order_app/Features/Home/stores/data/models/stores_model/store.dart';


class SearchStoresModel {
  List<Store>? stores;

  SearchStoresModel({this.stores});

  SearchStoresModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      stores = <Store>[];
      json['data'].forEach((v) {
        stores!.add(Store.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (stores != null) {
      data['data'] = stores!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
