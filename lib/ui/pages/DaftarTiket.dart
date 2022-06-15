// ignore_for_file: deprecated_member_use, must_be_immutable, avoid_unnecessary_containers
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DaftarTiket(),
    );
  }
}

class DaftarTiket extends StatefulWidget {
  const DaftarTiket({Key? key}) : super(key: key);

  @override
  State<DaftarTiket> createState() => _DaftarTiketState();
}

class _DaftarTiketState extends State<DaftarTiket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0,
        title: const Text(
          'Tickets Available',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 15,
          ),
        ),
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
            onPressed: () {},
            child: const Icon(Icons.arrow_back_rounded),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 400.0,
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (_, int index) => ListDataItem(listItem[0].title),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                bottom: 30.0,
              ),
              child: ElevatedButton(
                  onPressed: () {}, child: const Text('Checkout')),
            ),
          ],
        ),
      ),
    );
  }
}

class ListDataItem extends StatelessWidget {
  String itemName;

  ListDataItem(this.itemName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Card(
        elevation: 0.0,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
            left: 15.0,
            right: 15.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    listItem[0].title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5.0,
                    ),
                    child: Text(
                      listItem[0].subtitle,
                      style: const TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    listItem[0].price,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 5.0, 5.0, 3.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 35.0,
                          height: 20.0,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.all(5.0)),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black26),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                            child: const Text(
                              '-',
                              // style: TextStyle(
                              //   fontWeight: FontWeight.bold,
                              //   fontSize: 15.0,
                              // ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 5.0,
                          ),
                          child: SizedBox(
                            width: 35.0,
                            height: 20.0,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    const EdgeInsets.all(5.0)),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.cyan),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                              child: const Text(
                                '+',
                                // style: TextStyle(
                                //   fontWeight: FontWeight.bold,
                                //   fontSize: 15.0,
                                // ),
                              ),
                            ),
                          ),
                        ),
                        const VerticalDivider(),
                        Text(
                          listItem[0].total,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Item {
  String title;
  String subtitle;
  String price;
  String total;

  Item({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.total,
  });
}

var listItem = [
  Item(
    title: '[Dummy] Lorem Ipsum',
    subtitle: 'Pellentesque duis at quis convallis nunc',
    price: 'Rp 0',
    total: '0',
  ),
];
