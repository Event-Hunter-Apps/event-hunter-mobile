import 'package:event_hunter/models/checkout_model.dart';
import 'package:event_hunter/services/checkout_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckoutProvider with ChangeNotifier {
  List<CheckoutModel> _checkouts = [];

  List<CheckoutModel> get checkuots => _checkouts;

  set checkouts(List<CheckoutModel> checkouts) {
    _checkouts = checkuots;
    notifyListeners();
  }

  Future<bool> getMyCheckout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');
      List<CheckoutModel> checkouts =
          await CheckoutService().getCheckoutByUserID(token: token!);
      print(checkouts);
      return true;
    } catch (e) {
      print("masuk di checkout provider error");
      throw e;
    }
  }
}