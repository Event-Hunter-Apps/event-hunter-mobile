// import 'package:event_hunter/models/event_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:dio/dio.dart';
import 'package:event_hunter/models/ticket_model.dart';

class TicketApi {
  Future<TicketModel> getAllTicketByEvent({
    required int eventID,
    required String token,
  }) async {
    try {
      // Note : Untuk Register pada Firebase Auth
      // * (belum tersimpan ke firestore)
      var response =
          await Dio().get('http://10.0.2.2:8000/api/events/$eventID/tickets',
              options: Options(
                headers: {
                  "Accept": "application/json",
                  "Authorization": "Bearer $token",
                },
              ));
      final tickets = TicketModel.fromJson(response.data);
      return tickets;
    } catch (e) {
      print('masuk Error ticket api');
      throw e;
    }
  }
}
