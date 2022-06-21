import 'package:event_hunter/providers/checkout_provider.dart';
import 'package:event_hunter/providers/ticket_provider.dart';
import 'package:event_hunter/ui/pages/success_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    TicketProvider ticketProvider = Provider.of<TicketProvider>(context);
    CheckoutProvider checkoutPovider = Provider.of<CheckoutProvider>(context);
    AppBar appBar() {
      return AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0,
        title: const Text('Payment Method',
            style: TextStyle(color: Colors.black87, fontSize: 13)),
        leading: SizedBox(
          height: 10,
          width: 10,
          child: FlatButton(
            padding: const EdgeInsets.only(
              left: 15,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
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
              onPressed: () {
                checkoutPovider.createCheckout(
                    tikets: ticketProvider.tickets.tikets);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SuccessPage();
                    },
                  ),
                );
              },
              child: const Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
