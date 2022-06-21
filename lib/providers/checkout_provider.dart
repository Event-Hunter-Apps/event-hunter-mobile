import 'package:event_hunter/models/checkout_model.dart';
import 'package:event_hunter/models/ticket_model.dart';
import 'package:event_hunter/services/checkout_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckoutProvider with ChangeNotifier {
  List<CheckoutModel> _checkouts = [];

  List<CheckoutModel> get checkouts => _checkouts;

  set checkouts(List<CheckoutModel> checkouts) {
    _checkouts = checkouts;
    notifyListeners();
  }

  Future<void> getMyCheckout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');
      List<CheckoutModel> checkouts =
          await CheckoutService().getCheckoutByUserID(token: token!);

      _checkouts = checkouts;
    } catch (e) {
      print("masuk di checkout provider error");
      throw e;
    }
  }

  Future<void> createCheckout({required List<Tikets> tikets}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');

      bool behasil = await CheckoutService().createOrder(
        tikets: tikets,
        token: token!,
      );
    } catch (e) {
      throw e;
    }
  }
}
