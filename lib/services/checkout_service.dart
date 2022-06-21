import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:event_hunter/models/checkout_model.dart';

import '../models/order_model.dart';
import '../models/ticket_model.dart';

class CheckoutService {
  Future<List<CheckoutModel>> getCheckoutByUserID(
      {required String token}) async {
    try {
      print("test1234");
      var response = await Dio().get('http://10.0.2.2:8000/api/checkouts',
          options: Options(
            headers: {
              "Accept": "application/json",
              "Authorization": "Bearer $token",
            },
          ));
      late List<CheckoutModel> checkouts = [];

      for (var element in response.data["checkout"]) {
        var checkout = CheckoutModel.fromJson(element);
        checkouts.add(checkout);
      }

      return checkouts;
    } catch (e) {
      print("masuk di checkout service error");
      throw e;
    }
  }

  Future<bool> createOrder({
    required List<Tikets> tikets,
    required String token,
  }) async {
    try {
      List<Orders> temp = [];
      for (var element in tikets) {
        temp.add(Orders(ticketId: element.id, quantity: element.quantity));
      }

      OrderModel orders = OrderModel(orders: temp);

      var response = await Dio().post('http://10.0.2.2:8000/api/orders',
          data: {"orders": temp},
          options: Options(
            headers: {
              "Accept": "application/json",
              "Authorization": "Bearer $token",
            },
          ));

      print(response.data);
      return true;
    } catch (e) {
      throw e;
    }
  }
}
