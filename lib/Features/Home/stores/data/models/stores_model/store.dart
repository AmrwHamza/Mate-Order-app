class Store {
  int? id;
  int? userId;
  String? storeName;
  String? phone;
  dynamic createdAt;
  dynamic updatedAt;

  Store({
    this.id,
    this.userId,
    this.storeName,
    this.phone,
    this.createdAt,
    this.updatedAt,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        storeName: json['store_name'] as String?,
        phone: json['phone'] as String?,
        createdAt: json['created_at'] as dynamic,
        updatedAt: json['updated_at'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'store_name': storeName,
        'phone': phone,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}
