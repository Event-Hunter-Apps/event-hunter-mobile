import 'package:event_hunter/providers/checkout_provider.dart';
import 'package:event_hunter/ui/widgets/card_my_ticket.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyTicketPage extends StatelessWidget {
  MyTicketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool tiketAvailable = true;

    Widget noTiket() {
      return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: Material(
                  color: Color.fromARGB(255, 245, 245, 245),
                  shape: StadiumBorder(),
                  elevation: 3,
                  shadowColor: Colors.transparent,
                  child: Icon(
                    Icons.airplane_ticket_outlined,
                    color: Colors.cyan,
                    size: 150,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'No Ticket Available',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return tiketAvailable ? TicketList() : noTiket();
  }
}

class TicketList extends StatefulWidget {
  TicketList({Key? key}) : super(key: key);

  @override
  State<TicketList> createState() => _TicketListState();
}

class _TicketListState extends State<TicketList> {
  String nama = "";
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<CheckoutProvider>(context, listen: false)
          .getMyCheckout();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        nama = prefs.getString('nama').toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = Provider.of<CheckoutProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
        title: Text('Tickets Available',
            style: TextStyle(color: Colors.black87, fontSize: 13)),
      ),

      // ignore: avoid_unnecessary_containers
      body: Container(
        child: ListView.builder(
          itemCount: checkoutProvider.checkouts.length,
          itemBuilder: (_, int index) => GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/detail-tiket-page',
              );
            },
            child: CardMyTicket(
              id: checkoutProvider.checkouts[index].id,
              tanggal: checkoutProvider.checkouts[index].tanggalCheckout,
              harga: checkoutProvider.checkouts[index].totalHarga,
              nama: nama,
            ),
          ),
        ),
      ),
    );
  }
}
