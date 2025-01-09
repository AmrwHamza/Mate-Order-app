
class OrdersModel {
  final List<Order> orders;

  OrdersModel({required this.orders});


  factory OrdersModel.fromJsonList(List<dynamic> jsonList) {
    return OrdersModel(
      orders: jsonList.map((json) => Order.fromJson(json)).toList(),
    );
  }

  List<Map<String, dynamic>> toJsonList() {
    return orders.map((order) => order.toJson()).toList();
  }
}



class Order {
  final int id;
  final int userId;
  final String status;
  final double totalPrice;
  final int totalAmount;
  final String? sendDate;
  final String? receiveDate;
  final String createdAt;
  final String updatedAt;
  final int addressId;

  Order({
    required this.id,
    required this.userId,
    required this.status,
    required this.totalPrice,
    required this.totalAmount,
    this.sendDate,
    this.receiveDate,
    required this.createdAt,
    required this.updatedAt,
    required this.addressId,
  });

  // Factory constructor to create an Order from JSON
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      userId: json['user_id'],
      status: json['status'],
      totalPrice: (json['total_price'] as num).toDouble(),
      totalAmount: json['total_amount'],
      sendDate: json['send_date'] == '' ? null : json['send_date'],
      receiveDate: json['recive_date'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      addressId: json['address_id'],
    );
  }

  // Convert an Order object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'status': status,
      'total_price': totalPrice,
      'total_amount': totalAmount,
      'send_date': sendDate,
      'recive_date': receiveDate,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'address_id': addressId,
    };
  }
}
