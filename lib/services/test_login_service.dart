import 'package:dio/dio.dart';

class TestLoginService {
  void getHttp() async {
    try {
      var response = await Dio().get('http://127.0.0.1/api/events');
      print(response);
    } catch (e) {
      print(e);
    }
  }

  void register() async {
    try {
      var response = await Dio().post(
        'http://127.0.0.1/api/register',
        data: {
          "nama": "restu",
          "email": "restu@gmail.com",
          "no_hp": "0813123116732",
          "password": "123",
          "password_confirmation": "123",
          "role_id": 2
        },
      );
      print(response.statusCode);
    } catch (e) {}
  }
}
