// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:event_hunter/models/user_model.dart';
import 'package:event_hunter/services/auth_services.dart';
import 'package:event_hunter/services/user_service.dart';

import 'package:flutter/cupertino.dart';

import 'package:shared_preferences/shared_preferences.dart';

enum AuthState {
  none,
  loading,
  error,
}

class AuthProvider with ChangeNotifier {
  // note : Start Code Auth State

  AuthState _authState = AuthState.none;
  AuthState get authState => _authState;

  changeState(AuthState authState) {
    _authState = authState;
    notifyListeners();
  }

  // note : End Code Auth State

  late UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> signUp({
    required String email,
    required String password,
    required String passwordConfirmation,
    required String name,
    required String phoneNumber,
  }) async {
    changeState(AuthState.loading);
    try {
      UserModel user = await AuthService().signUp(
        email: email,
        password: password,
        passwordConfirmation: passwordConfirmation,
        name: name,
        phoneNumber: phoneNumber,
      );

      _user = user;

      // note : SharedPref

      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (user.token != null) {
        prefs.setString('token', user.token!);
      }
      print(user.fullName);
      if (user.token != null) {
        prefs.setString('nama', user.fullName!);
      }
      // String userSaved = json.encode(_user.toJson());
      // prefs.setString('userSaved', userSaved);

      // _user = UserModel.fromJson(json.decode(userSaved));

      // note : End

      changeState(AuthState.none);

      return true;
    } catch (e) {
      print(e.toString() + " { disini errornya }");

      changeState(AuthState.error);

      throw e;

      return false;
    }
  }

  Future<bool> updateProfile({
    required String fullName,
    required String phoneNumber,
  }) async {
    changeState(AuthState.loading);
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');
      UserModel user = await AuthService().updateUser(
        fullName: fullName,
        phoneNumber: phoneNumber,
        token: token!,
      );

      _user = user;

      // note : SharedPref

      if (user.token != null) {
        prefs.setString('nama', user.fullName!);
      }
      // String userSaved = json.encode(_user.toJson());
      // prefs.setString('userSaved', userSaved);

      // _user = UserModel.fromJson(json.decode(userSaved));

      // note : End

      changeState(AuthState.none);

      return true;
    } catch (e) {
      print(e.toString() + " { disini errornya }");

      changeState(AuthState.error);

      throw e;

      return false;
    }
  }

  Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    changeState(AuthState.loading);
    try {
      UserModel user = await AuthService().signIn(
        email: email,
        password: password,
      );

      _user = user;

      // note : SharedPref

      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (user.token != null) {
        prefs.setString('token', user.token!);
      }
      if (user.token != null) {
        prefs.setString('nama', user.fullName!);
      }
      print(prefs.getString('nama'));
      // String userSaved = json.encode(_user.toJson());
      // prefs.setString('userSaved', userSaved);

      // _user = UserModel.fromJson(json.decode(userSaved));

      // note : End

      changeState(AuthState.none);

      return true;
    } catch (e) {
      print(e.toString() + " { disini errornya }");

      changeState(AuthState.error);

      throw e;

      return false;
    }
  }

  Future<bool> getUserActive() async {
    // NOTE bagian bawah klo dijalanin error makanya gua comment
    // changeState(AuthState.loading);
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');
      UserModel user = await AuthService().getUserByToken(token: token!);

      _user = user;

      // note : SharedPref

      // SharedPreferences prefs = await SharedPreferences.getInstance();

      // String userSaved = json.encode(_user.toJson());
      // prefs.setString('userSaved', userSaved);

      // _user = UserModel.fromJson(json.decode(userSaved));

      // note : End

      changeState(AuthState.none);

      return true;
    } catch (e) {
      print(e.toString() + " { disini errornya }");

      changeState(AuthState.error);

      throw e;

      return false;
    }
  }
  // Future<void> getUserActive() async {
  //   try {
  //     final currentUser = FirebaseAuth.instance.currentUser;
  //     print(currentUser);

  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     var user = prefs.getString('userSaved');

  //     var getUser = UserModel.fromJson(json.decode(user!));

  //     _user = getUser;

  //     print('USER ACTIVE NOW');
  //     print(_user.email);
  //     print(_user.fullName);
  //     print(_user.role);
  //     print(_user.uid);
  //   } catch (e) {
  //     print(e);
  //   }
  //   notifyListeners();
  // }
  Future<bool> changePassword({required String password}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');
      print("masuk ke provider dan ini tokenya $token");
      await AuthService().changePassword(password: password, token: token!);

      return true;
    } catch (e) {
      throw e;
    }
  }

  Future<bool> signOut() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');
      print("masuk ke provider dan ini tokenya $token");
      await AuthService().signOut(token: token!);
      prefs.remove('userSaved');
      prefs.remove('token');
      print('Berhasil Logout');
      return true;
    } catch (e) {
      print(e.toString() + " { disini errornya }");
      return false;
    }
  }
}
