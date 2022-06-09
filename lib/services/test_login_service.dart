import 'package:dio/dio.dart';

class TestLoginService {
  void getHttp() async {
    try {
      var response = await Dio().get(
          'https://e226efdc-1950-418f-a3a5-75bfc54b58c7.mock.pstmn.io/api/events');
      print(response);
    } catch (e) {
      print(e);
    }
  }

  void register() async {
    try {
      var response = await Dio().post(
        'https://e226efdc-1950-418f-a3a5-75bfc54b58c7.mock.pstmn.io/api/register',
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
