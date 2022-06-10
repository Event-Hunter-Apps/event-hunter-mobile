// ignore_for_file: sort_child_properties_last, deprecated_member_use

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PaymentPage(),
    );
  }
}

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int value = 0;
  final paymentLabels = [
    'Cash',
    'Debit',
  ];

  final paymentIcon = [
    Icons.money_rounded,
    Icons.credit_card_rounded,
  ];


  @override
  Widget build(BuildContext context) {
    AppBar appBar() {
      return AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0,
        title: const Text('Payment Method', style: TextStyle(color: Colors.black87, fontSize: 13)),
        leading: SizedBox(
          height: 10,
          width: 10,
          child: FlatButton(
            padding: const EdgeInsets.only(
              left: 15,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50)
            ),
            color: Colors.white,
            onPressed: () {},
            child: const Icon(Icons.arrow_back_rounded),
          ),
        ),
      );
    }
    
    return Scaffold(
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 10.0,
                left: 10.0,
                bottom: 20.0,
              ),
              child: Text(
                'Choose yout payment method to checkout : ',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 13,
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: paymentLabels.length,
                itemBuilder: (content, index) {
                  return ListTile(
                    leading: Radio(
                      value: index,
                      groupValue: value,
                      onChanged: (i) => setState(() => value = index),
                    ),
                    title: Text(
                      paymentLabels[index],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    trailing: Icon(paymentIcon[index]),
                  );
                }, 
                separatorBuilder: (content, index) {
                  return const Divider();
                }, 
              ),
            ),
            ElevatedButton(
              onPressed: () {}, 
              child: const Text(
                'Checkout'
              )
            ),
          ],
        ),
      ),
    );
  }
}