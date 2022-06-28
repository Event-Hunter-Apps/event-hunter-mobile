// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:dio/dio.dart';
import 'package:event_hunter/models/user_model.dart';
import 'package:event_hunter/providers/auth_provider.dart';
import 'package:event_hunter/shared/theme.dart';
import 'package:event_hunter/ui/widgets/loading_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController newPasswordController = TextEditingController(text: '');
  TextEditingController confirmPasswordController =
      TextEditingController(text: '');

  bool isLoading = false;

  final formKey = GlobalKey<FormState>();

  void initState() {
    super.initState();

    Provider.of<AuthProvider>(context, listen: false).getUserActive();
  }

  @override
  Widget build(BuildContext context) {
    // bool isLoading = AuthProvider().authState == AuthState.loading;
    // bool isLoading = false;

    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    UserModel user = authProvider.user;

    newPasswordController.text = '';
    confirmPasswordController.text = '';
    // roleController.text = user.role!.toString();

    handleChangePassword() async {
      setState(() {
        isLoading = true;
      });

      bool passwordSama =
          newPasswordController.text == confirmPasswordController.text;

      try {
        if (passwordSama &&
            await authProvider.changePassword(
                password: newPasswordController.text)) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 2),
              backgroundColor: successColor,
              content: Text(
                'Password Berhasil Update',
                textAlign: TextAlign.center,
              ),
            ),
          );
          Future.delayed(Duration(milliseconds: 2500), () async {
            Navigator.pop(context);
          });
        } else if (!passwordSama) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 2),
              backgroundColor: alertColor,
              content: Text(
                'Password tidak sama',
                textAlign: TextAlign.center,
              ),
            ),
          );
        }
      } on DioError catch (e) {
        String handlingErrorCode(String errorCode) {
          return errorCode;
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: Text(
              handlingErrorCode(e.response?.data["message"]),
              textAlign: TextAlign.center,
            ),
          ),
        );
      }

      setState(() {
        isLoading = false;
      });
    }

    Widget newPasswordInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: secondaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor1,
                borderRadius: BorderRadius.circular(
                  12,
                ),
                border: Border.all(
                  color: greyColor,
                  width: 1.5,
                ),
              ),
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        controller: newPasswordController,
                        style: secondaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: 'New Password',
                          hintStyle: subtitleTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: medium,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            //allow upper and lower case alphabets, space, and number
                            return "Paswoord Required";
                          } else if (!RegExp(r'^[a-z A-Z 0-9]+$')
                              .hasMatch(value)) {
                            return "Enter Correct Name";
                          } else if (value.length > 50) {
                            return "Name too long";
                          }
                          {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget confirmPasswordInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Confirmation Password',
              style: secondaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor1,
                borderRadius: BorderRadius.circular(
                  12,
                ),
                border: Border.all(
                  color: greyColor,
                  width: 1.5,
                ),
              ),
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        keyboardType: TextInputType.number,
                        controller: confirmPasswordController,
                        style: secondaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Confirmation Password',
                          hintStyle: subtitleTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: medium,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Confirm Password Required";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget changePasswordButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              handleChangePassword();
            }
            FocusManager.instance.primaryFocus?.unfocus();
          },
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Change Password',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 35, 20, 0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print('Back');
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffF4FFFE),
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          color: Color(0xff32B0C7),
                        ),
                      ),
                    ),
                    Text(
                      'Change Password',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    SizedBox(
                      width: 32,
                      height: 32,
                    ),
                  ],
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    newPasswordInput(),
                    confirmPasswordInput(),
                    isLoading ? LoadingButton() : changePasswordButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: footer(),
    );
  }
}
