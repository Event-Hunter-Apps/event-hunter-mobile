class OrderModel {
  late List<Orders> orders;

  OrderModel({required this.orders});

  OrderModel.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = [];
      json['orders'].forEach((v) {
        orders.add(new Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orders != null) {
      data['orders'] = this.orders.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  late int ticketId;
  late int quantity;

  Orders({
    required this.ticketId,
    required this.quantity,
  });

  Orders.fromJson(Map<String, dynamic> json) {
    ticketId = json['ticket_id'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ticket_id'] = this.ticketId;
    data['quantity'] = this.quantity;
    return data;
  }
}
