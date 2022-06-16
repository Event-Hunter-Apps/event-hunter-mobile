import 'package:dio/dio.dart';
import 'package:event_hunter/models/checkout_model.dart';

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
      print("dibawah ini adlah loopinggggg");
      for (var element in response.data["checkouts"]) {
        print(element);
        var checkout = CheckoutModel.fromJson(element);
        checkouts.add(checkout);
      }
      print("diatas ini adlah loopinggggg");
      return checkouts;
    } catch (e) {
      print("masuk di checkout service error");
      throw e;
    }
  }
}