class CheckoutModel {
  late int id;
  late int userId;
  late String tanggalCheckout;
  late String status;
  late int totalHarga;
  late String? paidAt;
  late String? createdAt;
  late String? updatedAt;
  late String? deletedAt;

  CheckoutModel({
    required this.id,
    required this.userId,
    required this.tanggalCheckout,
    required this.status,
    required this.totalHarga,
    required this.paidAt,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  CheckoutModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    tanggalCheckout = json['tanggal_checkout'];
    status = json['status'];
    totalHarga = json['total_harga'];
    String? paidAt = json['paid_at'];
    String? createdAt = json['created_at'];
    String? updatedAt = json['updated_at'];
    String? deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['tanggal_checkout'] = this.tanggalCheckout;
    data['status'] = this.status;
    data['total_harga'] = this.totalHarga;
    data['paid_at'] = this.paidAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
