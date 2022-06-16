import 'package:event_hunter/models/ticket_model.dart';
import 'package:event_hunter/models/event_model.dart';
import 'package:event_hunter/services/api/ticket_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TicketProvider with ChangeNotifier {
  late TicketModel _tickets;

  TicketModel get tickets => _tickets;

  set tickets(TicketModel tickets) {
    _tickets = tickets;
    notifyListeners();
  }

  Future<void> getTiketsFromAPI({required int eventID}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');

      TicketModel tickets = await TicketApi().getAllTicketByEvent(
        eventID: eventID,
        token: token!,
      );

      _tickets = tickets;
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Future<bool> getTicketOfEvent() async {
    try {
      return true;
    } catch (e) {
      print(e.toString() + " { disini errornya }");

      throw e;

      return false;
    }
  }

  // addCart(EventModel product) {
  //   if (productExist(product)) {
  //     int index =
  //         _carts.indexWhere((element) => element.product!.id == product.id);

  //     _carts[index].quantity = _carts[index].quantity! + 1;
  //   } else {
  //     _carts.add(
  //       CartModel(
  //         id: _carts.length,
  //         product: product,
  //         quantity: 1,
  //       ),
  //     );
  //   }

  //   notifyListeners();
  // }

  // removeCart(int id) {
  //   _carts.removeAt(id);

  //   notifyListeners();
  // }

  // addQuantity(int id) {
  //   _carts[id].quantity = _carts[id].quantity! + 1;

  //   notifyListeners();
  // }

  // reduceQuantity(int id) {
  //   _carts[id].quantity = _carts[id].quantity! - 1;

  //   if (_carts[id].quantity == 0) {
  //     removeCart(id);
  //   }

  //   notifyListeners();
  // }

  // totalItems() {
  //   int total = 0;

  //   for (var item in _carts) {
  //     total += item.quantity!;
  //   }
  //   return total;
  // }

  // totalPrice() {
  //   double total = 0;

  //   for (var item in _carts) {
  //     total += (item.quantity! * item.product!.harga!);
  //   }
  //   return total;
  // }

  // productExist(EventModel product) {
  //   if (_carts.indexWhere((element) => element.product!.id == product.id) ==
  //       -1) {
  //     return false;
  //   } else {
  //     return true;
  //   }
  // }
}
