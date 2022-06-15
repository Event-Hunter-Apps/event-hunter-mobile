// ignore_for_file: deprecated_member_use, must_be_immutable, avoid_unnecessary_containers, prefer_const_constructors
import 'package:flutter/material.dart';

class DaftarTiketAvailablePage extends StatefulWidget {
  DaftarTiketAvailablePage({Key? key}) : super(key: key);

  @override
  State<DaftarTiketAvailablePage> createState() =>
      _DaftarTiketAvailablePageState();
}

class _DaftarTiketAvailablePageState extends State<DaftarTiketAvailablePage> {
  @override
  Widget build(BuildContext context) {
    var listItem = [
      Item(
        title: 'Dewasaaa',
        subtitle: 'Tiket Dewasa',
        price: 10000,
        total: 0,
      ),
      Item(
        title: 'Anak-Anak',
        subtitle: 'Tiket Anak-Anak',
        price: 5000,
        total: 0,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
        title: Text(
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 600.0,
              child: ListView.builder(
                itemCount: listItem.length,
                itemBuilder: (_, int index) => ListDataItem(
                  itemName: listItem[index].title,
                  itemDeskripsi: listItem[index].subtitle,
                  itemPrice: listItem[index].price,
                  itemTotal: listItem[index].total,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20.0,
                bottom: 30.0,
              ),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Checkout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListDataItem extends StatefulWidget {
  String itemName;
  String itemDeskripsi;
  int itemPrice;
  int itemTotal;

  ListDataItem({
    required this.itemName,
    required this.itemDeskripsi,
    required this.itemPrice,
    required this.itemTotal,
    Key? key,
  }) : super(key: key);

  @override
  State<ListDataItem> createState() => _ListDataItemState();
}

class _ListDataItemState extends State<ListDataItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Card(
        elevation: 0.0,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10.0,
            left: 15.0,
            right: 15.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.itemName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 5.0,
                      ),
                      child: Text(
                        widget.itemDeskripsi,
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ('Rp ${widget.itemPrice}'),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 5.0, 5.0, 3.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 35.0,
                          height: 20.0,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.all(5.0)),
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
                            child: Text(
                              '-',
                              // style: TextStyle(
                              //   fontWeight: FontWeight.bold,
                              //   fontSize: 15.0,
                              // ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 5.0,
                          ),
                          child: SizedBox(
                            width: 35.0,
                            height: 20.0,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  widget.itemTotal + 1;
                                });
                              },
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.all(5.0)),
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
                              child: Text(
                                '+',
                                // style: TextStyle(
                                //   fontWeight: FontWeight.bold,
                                //   fontSize: 15.0,
                                // ),
                              ),
                            ),
                          ),
                        ),
                        VerticalDivider(),
                        Text(
                          widget.itemTotal.toString(),
                          style: TextStyle(
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
  int price;
  int total;

  Item({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.total,
  });
}
