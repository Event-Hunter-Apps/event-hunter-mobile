// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:event_hunter/shared/theme.dart';
import 'package:flutter/material.dart';

class SuccessPage extends StatefulWidget {
  SuccessPage({Key? key}) : super(key: key);

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    AppBar appBar() {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: SizedBox(
          height: 30,
          width: 30,
          child: FlatButton(
            padding: EdgeInsets.only(left: 15, top: 15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            color: Colors.white,
            onPressed: () {
              Navigator.restorablePushNamedAndRemoveUntil(
                context,
                '/home',
                (route) => false,
              );
            },
            child: Icon(Icons.close),
          ),
        ),
      );
    }

    Widget body() {
      return Scaffold(
        body: Container(
          padding: EdgeInsets.only(left: 40, right: 40),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Material(
                      color: primaryColor,
                      shape: StadiumBorder(),
                      elevation: 3,
                      child: Icon(
                        Icons.check_rounded,
                        color: Colors.white,
                        size: 80,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'Checkout Berhasil',
                      style: blackTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }
}
