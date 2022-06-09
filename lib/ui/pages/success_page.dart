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
            child: Icon(Icons.arrow_back_rounded),
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                'Dibeli',
                                style: blackTextStyle.copyWith(
                                  fontSize: 13,
                                  fontWeight: medium,
                                ),
                              ),
                            ),
                            Text(
                              'Kamis, 26 Mei 2020',
                              style: blackTextStyle.copyWith(
                                fontSize: 13,
                                fontWeight: reguler,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                'Metode Pembayaran',
                                style: blackTextStyle.copyWith(
                                  fontSize: 13,
                                  fontWeight: medium,
                                ),
                              ),
                            ),
                            Text(
                              'Transfer',
                              style: blackTextStyle.copyWith(
                                fontSize: 13,
                                fontWeight: reguler,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                'Rincian Harga',
                                style: blackTextStyle.copyWith(
                                  fontSize: 13,
                                  fontWeight: medium,
                                ),
                              ),
                            ),
                            Text(
                              'Rp 250.000',
                              style: blackTextStyle.copyWith(
                                fontSize: 13,
                                fontWeight: reguler,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Jenis Tiket',
                              style: blackTextStyle.copyWith(
                                fontSize: 13,
                                fontWeight: bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                'Tiket Anak',
                                style: blackTextStyle.copyWith(
                                  fontSize: 13,
                                  fontWeight: medium,
                                ),
                              ),
                            ),
                            Text(
                              'Rp 30.000 x 5',
                              style: blackTextStyle.copyWith(
                                fontSize: 13,
                                fontWeight: reguler,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                'Tiket Dewasa',
                                style: blackTextStyle.copyWith(
                                  fontSize: 13,
                                  fontWeight: medium,
                                ),
                              ),
                            ),
                            Text(
                              'Rp 50.000 x 2',
                              style: blackTextStyle.copyWith(
                                fontSize: 13,
                                fontWeight: reguler,
                              ),
                            ),
                          ],
                        ),
                      ],
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
