import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:event_hunter/models/user_model.dart';
import 'package:event_hunter/services/user_service.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Future<UserModel> signIn({
  //   required String email,
  //   required String password,
  // }) async {
  //   try {
  //     // note : proses sign in dengan email & password
  //     UserCredential userCredential =
  //         await _firebaseAuth.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );

  //     // note : mencari user yang ada pada firestore berdasarkan user id (uid)
  //     UserModel user =
  //         await UserService().getUserById(userCredential.user!.uid);

  //     // note : mereturn user
  //     return user;
  //   } catch (e) {
  //     throw e;
  //   }
  // }

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
      print(name);
      print(email);
      var response = await Dio().post(
        'https://e226efdc-1950-418f-a3a5-75bfc54b58c7.mock.pstmn.io/api/register',
        data: {
          "nama": name,
          "email": email,
          "no_hp": phoneNumber,
          "password": password,
          "password_confirmation": passwordConfirmation,
          "role_id": 2,
        },
      );
      final Map parsed = json.decode(response.data);
      final user = UserModel.fromJson(parsed);

      // note : melakukan set user (menyimpan data user pada firestore)
      // await UserService().setUser(user);
      return user;
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

}
