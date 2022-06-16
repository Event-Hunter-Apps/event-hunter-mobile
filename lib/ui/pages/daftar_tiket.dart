// ignore_for_file: deprecated_member_use, must_be_immutable, avoid_unnecessary_containers, unnecessary_brace_in_string_interps, prefer_const_constructors

import 'package:event_hunter/providers/ticket_provider.dart';
import 'package:event_hunter/ui/pages/payment_page.dart';
import 'package:event_hunter/ui/widgets/cart_card.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class DaftarTiket extends StatefulWidget {
  DaftarTiket({Key? key}) : super(key: key);

  @override
  State<DaftarTiket> createState() => _DaftarTiketState();
}

class _DaftarTiketState extends State<DaftarTiket> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // await Provider.of<EventProvider>(context, listen: false).getEvents();
      int eventID = ModalRoute.of(context)!.settings.arguments as int;

      print(eventID);

      await Provider.of<TicketProvider>(context, listen: false)
          .getTiketsFromAPI(eventID: eventID);

      // await Provider.of<AuthProvider>(context, listen: false).getUserActive();
    });
  }

  @override
  Widget build(BuildContext context) {
    TicketProvider ticketProvider = Provider.of<TicketProvider>(context);

    PreferredSizeWidget appbar() {
      return AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
        title: Text(
          '${ticketProvider.tickets.event!.nama}',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 15,
          ),
        ),
        leading: SizedBox(
          height: 10,
          width: 10,
          child: FlatButton(
            padding: EdgeInsets.only(
              left: 15,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_rounded),
          ),
        ),
      );
    }

    Widget body() {
      return SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 450.0,
              child: ListView.builder(
                // children: List.generate(10, (int i) =>  ListTileItem()),
                itemCount: ticketProvider.tickets.tikets.length,
                itemBuilder: (_, int index) => CartCard(
                  itemTitle: ticketProvider.tickets.tikets[index].nama,
                  deskripsi: ticketProvider.tickets.tikets[index].deskripsi,
                  harga: ticketProvider.tickets.tikets[index].harga,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 30.0,
                bottom: 30.0,
              ),
              child: SizedBox(
                height: 30.0,
                width: 100.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      PageTransition(
                        child: PaymentPage(),
                        type: PageTransitionType.rightToLeft,
                      ),
                    );
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(5.0)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.cyan),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  child: Text('Checkout'),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: appbar(),
      body: body(),
    );
  }
}

class Item {
  int id;
  String title;
  String subtitle;
  int price;
  String total;

  Item({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.total,
  });
}

var listItem = [
  Item(
    id: 1,
    title: 'Dewasa',
    subtitle: 'Tiket Dewasa',
    price: 10000,
    total: '0',
  ),
];
