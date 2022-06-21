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
      print(response.data);
      for (var element in response.data["checkout"]) {
        print(element);
        var checkout = CheckoutModel.fromJson(element);
        checkouts.add(checkout);
      }
      print(checkouts.toString());
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
      List<Orders> orders = [];
      for (var element in tikets) {
        orders.add(Orders(
          ticketId: element.id,
          quantity: element.quantity,
        ));
      }

      OrderModel orderModel = OrderModel(orders: orders);
      // * (belum tersimpan ke firestore)

      var response = await Dio().post('http://10.0.2.2:8000/api/orders',
          data: {
            orderModel.toJson(),
          },
          options: Options(
            headers: {
              "Accept": "application/json",
              "Authorization": "Bearer $token",
            },
          ));

      return true;
    } catch (e) {
      print('masuk Error ticket api');
      throw e;
    }
  }
}
