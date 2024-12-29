class AddressListModel {
  List<Address>? addresses;

  AddressListModel({this.addresses});

  factory AddressListModel.fromJson(List<dynamic> jsonList) {
    try {
      return AddressListModel(
        addresses: jsonList.map((json) {
          var addressData = json['address'];
          if (addressData == null) {
            throw Exception('Missing address data');
          }
          return Address.fromJson(addressData);
        }).toList(),
      );
    } catch (e) {
      throw Exception('Error parsing AddressListModel: $e');
    }
  }
}

class Address {
  final int id;
  final int userId;
  final String createdAt;
  final String updatedAt;
  final String title;
  final double latitude;
  final double longitude;
  final String description;

  Address({
    required this.id,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    required this.latitude,
    required this.longitude,
    required this.description,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      userId: json['user_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      title: json['title'],
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      description: json['description'],
    );
  }
}
