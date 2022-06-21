import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:event_hunter/models/user_model.dart';
import 'package:event_hunter/services/user_service.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      String base_url = 'http://10.0.2.2:8000/api/login';
      print(base_url);
      var response = await Dio().post('http://10.0.2.2:8000/api/login',
          data: {
            "email": email,
            "password": password,
          },
          options: Options(
            headers: {"Accept": "application/json"},
          ));
      final user = UserModel.createUser(response.data);
      return user;
    } catch (e) {
      print('masuk Error service');
      throw e;
    }
  }

  Future<UserModel> signUp({
    required String email,
    required String password,
    required String passwordConfirmation,
    required String name,
    required String phoneNumber,
  }) async {
    try {
      // Note : Untuk Register pada Firebase Auth
      // * (belum tersimpan ke firestore)
      var response = await Dio().post('http://10.0.2.2:8000/api/register',
          data: {
            "nama": name,
            "email": email,
            "no_hp": phoneNumber,
            "password": password,
            "password_confirmation": passwordConfirmation,
            "role_id": 2,
          },
          options: Options(
            headers: {"Accept": "application/json"},
          ));
      final user = UserModel.createUser(response.data);
      return user;
    } catch (e) {
      print('masuk Error service');
      throw e;
    }
  }

  Future<void> signOut({required String token}) async {
    try {
      print("masuk ke service dan in tokenya $token");
      var response = await Dio().get('http://10.0.2.2:8000/api/logout',
          options: Options(
            headers: {
              "Accept": "application/json",
              "Authorization": "Bearer $token"
            },
          ));
    } catch (e) {
      throw e;
    }
  }
  // Future<void> signOut() async {
  //   try {
  //     await _firebaseAuth.signOut();
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  // Future<UserModel> updateUser({
  //   required String fullName,
  //   required int phoneNumber,
  // }) async {
  //   try {
  //     final currentUser = FirebaseAuth.instance.currentUser;
  //     print(currentUser);

  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     var user = prefs.getString('userSaved');

  //     var getUser = UserModel.fromJson(json.decode(user!));

  //     UserModel userUpdated = UserModel(
  //       uid: getUser.uid,
  //       email: getUser.email,
  //       fullName: fullName,
  //       role: getUser.role,
  //       phoneNumber: phoneNumber,
  //     );

  //     // note : melakukan set user (menyimpan data user pada firestore)
  //     await UserService().setUser(userUpdated);

  //     return userUpdated;
  //   } catch (e) {
  //     throw e;
  //   }
  // }
  Future<UserModel> getUserByToken({required String token}) async {
    try {
      // Note : Untuk Register pada Firebase Auth
      // * (belum tersimpan ke firestore)
      var response = await Dio().get('http://10.0.2.2:8000/api/my-profile',
          options: Options(
            headers: {
              "Accept": "application/json",
              "Authorization": "Bearer $token"
            },
          ));

      final user = UserModel.createUser(response.data);
      return user;
    } catch (e) {
      print('masuk Error service');
      throw e;
    }
  }

  Future<UserModel> updateUser({
    required String fullName,
    required String phoneNumber,
    required String token,
  }) async {
    try {
      // Note : Untuk Register pada Firebase Auth
      // * (belum tersimpan ke firestore)
      var response =
          await Dio().put('http://10.0.2.2:8000/api/update-user-active',
              data: {
                "nama": fullName,
                "no_hp": phoneNumber,
              },
              options: Options(
                headers: {
                  "Accept": "application/json",
                  "Authorization": "Bearer ${token}"
                },
              ));
      print("lalala hore ${response.data["user"]}");
      final user = UserModel.createUser(response.data);
      return user;
    } catch (e) {
      print('masuk Error service');
      throw e;
    }
  }
}
