// ignore_for_file: deprecated_member_use, must_be_immutable, avoid_unnecessary_containers, unnecessary_brace_in_string_interps
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50)
            ),
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
              height: 450.0,
              child: ListView.builder(
                // children: List.generate(10, (int i) => const ListTileItem()),
                itemCount: 10,
                itemBuilder: (_, int index) => const ListTileItem(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 30.0,
                bottom: 30.0,
              ),
              child: SizedBox(
                height: 30.0,
                width: 100.0,
                child: ElevatedButton(
                  onPressed: (){},
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(5.0)),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ), 
                  child: const Text(
                    'Checkout'
                  ),
                ),
              ),
            ),
          ],
        ),
      ), 
    );
  }
}

class ListTileItem extends StatefulWidget {
  // final String title;
  // const ListTileItem({required this.title, Key? key}) : super(key: key);
  const ListTileItem({Key? key}) : super(key: key);

  @override
  State<ListTileItem> createState() => _ListTileItemState();
}

class _ListTileItemState extends State<ListTileItem> {
  int _itemCount = 0;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        listItem[0].title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 3.0),
        child: Text(
          listItem[0].subtitle,
        ),
      ),
      onTap: null,
      trailing: _buildTrailingWidget(),

    );
  }

  Widget _buildTrailingWidget() {
    return Container(
      margin: const EdgeInsets.only(top: 3.0),
      child: FittedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              padding: const EdgeInsets.only(top: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 35.0,
                    height: 20.0,
                    child: ElevatedButton(
                      onPressed: () => 
                        setState(() => _itemCount != 0 ? _itemCount-- : _itemCount),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(5.0)),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.black26),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ), 
                      child: const Icon(
                        Icons.remove,
                        size: 13.0,
                      ),
                    ),
                  ),
                  const VerticalDivider(
                    width: 10.0,
                  ),
                  SizedBox(
                    width: 35.0,
                    height: 20.0,
                    child: ElevatedButton(
                      onPressed: () => 
                        setState(() => _itemCount++),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(5.0)),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ), 
                      child: const Icon(
                        Icons.add,
                        size: 13.0,
                      ),
                    ),
                  ),
                  const VerticalDivider(),
                  Text(
                    _itemCount.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
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

  Item(
    {
      required this.title, 
      required this.subtitle,
      required this.price, 
      required this.total,
    }
  );
}

var listItem = [
  Item(
    title: '[Dummy] Lorem Ipsum',
    subtitle: 'Pellentesque duis at quis convallis nunc',
    price: 'Rp 0',
    total: '0',
  ),
];