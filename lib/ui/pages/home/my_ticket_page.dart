import 'package:event_hunter/providers/checkout_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyTicketPage extends StatelessWidget {
  const MyTicketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool tiketAvailable = true;

    Widget noTiket() {
      return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
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

    Widget availableTiket() {
      return Card(
        elevation: 7.0,
        // ignore: avoid_unnecessary_containers
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 130,
              // margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        listItem[0].title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                        ),
                      ),
                      Text(
                        listItem[0].price,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                          color: Colors.cyan,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5.0,
                    ),
                    child: Text(
                      listItem[0].tanggal,
                      style: const TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          listItem[0].timeStart,
                          style: const TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 15.0,
                            top: 3.0,
                          ),
                          child: Icon(
                            Icons.circle,
                            size: 8.0,
                            color: Colors.cyan,
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 4),
                            // ignore: sized_box_for_whitespace
                            child: Container(
                              height: .5,
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: const DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            right: 15.0,
                            top: 3.0,
                          ),
                          child: Icon(
                            Icons.circle,
                            size: 8.0,
                            color: Colors.cyan,
                          ),
                        ),
                        Text(
                          listItem[0].timeEnd,
                          style: const TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      listItem[0].name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            SizedBox(
              width: double.infinity,
              height: 50.0,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 5.0,
                    left: 10.0,
                    right: 10.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 40.0,
                        width: 40.0,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          color: Colors.black12,
                          onPressed: () {},
                          child: const Icon(
                            Icons.favorite,
                            color: Colors.black45,
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 15,
                            color: Colors.cyan,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        onPressed: () {},
                        child: const Text('Lihat detail'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return tiketAvailable ? TicketList() : noTiket();
  }
}

class TicketList extends StatefulWidget {
  const TicketList({Key? key}) : super(key: key);

  @override
  State<TicketList> createState() => _TicketListState();
}

class _TicketListState extends State<TicketList> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<CheckoutProvider>(context, listen: false)
          .getMyCheckout();
    });
  }

  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = Provider.of<CheckoutProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0,
        title: const Text('Tickets Available',
            style: TextStyle(color: Colors.black87, fontSize: 13)),
      ),

      // ignore: avoid_unnecessary_containers
      body: Container(
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (_, int index) => GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/detail-tiket',
              );
            },
            child: listDataItem(listItem[0].name),
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types, must_be_immutable
class listDataItem extends StatelessWidget {
  String itemName;

  listDataItem(this.itemName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7.0,
      // ignore: avoid_unnecessary_containers
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 130,
            // margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      listItem[0].title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                      ),
                    ),
                    Text(
                      listItem[0].price,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                        color: Colors.cyan,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5.0,
                  ),
                  child: Text(
                    listItem[0].tanggal,
                    style: const TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        listItem[0].timeStart,
                        style: const TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 15.0,
                          top: 3.0,
                        ),
                        child: Icon(
                          Icons.circle,
                          size: 8.0,
                          color: Colors.cyan,
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 4),
                          // ignore: sized_box_for_whitespace
                          child: Container(
                            height: .5,
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: const DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          right: 15.0,
                          top: 3.0,
                        ),
                        child: Icon(
                          Icons.circle,
                          size: 8.0,
                          color: Colors.cyan,
                        ),
                      ),
                      Text(
                        listItem[0].timeEnd,
                        style: const TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    listItem[0].name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          SizedBox(
            width: double.infinity,
            height: 50.0,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 5.0,
                  left: 10.0,
                  right: 10.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 40.0,
                      width: 40.0,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        color: Colors.black12,
                        onPressed: () {},
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.black45,
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                          fontSize: 15,
                          color: Colors.cyan,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('Lihat detail'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Item {
  String title;
  String tanggal;
  String timeStart;
  String timeEnd;
  String name;
  String price;

  Item(
      {required this.title,
      required this.tanggal,
      required this.timeStart,
      required this.timeEnd,
      required this.name,
      required this.price});
}

var listItem = [
  Item(
      title: 'Monas Jakarta',
      tanggal: '8 Juni 2020',
      timeStart: '08:00 AM',
      timeEnd: '18:00 PM',
      name: 'Mr. Irwan Reza Firmansyah',
      price: 'Rp 25.000'),
];
