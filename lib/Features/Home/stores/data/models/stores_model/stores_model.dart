import 'data.dart';
import 'pagination.dart';

class StoresModel {
	Data? data;
	Pagination? pagination;

	StoresModel({this.data, this.pagination});

	factory StoresModel.fromJson(Map<String, dynamic> json) => StoresModel(
				data: json['data'] == null
						? null
						: Data.fromJson(json['data'] as Map<String, dynamic>),
				pagination: json['pagination'] == null
						? null
						: Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'data': data?.toJson(),
				'pagination': pagination?.toJson(),
			};
}
