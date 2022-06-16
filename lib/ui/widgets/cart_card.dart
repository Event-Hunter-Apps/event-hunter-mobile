import 'package:flutter/material.dart';

class CartCard extends StatefulWidget {
  // final String title;

  final String itemTitle;
  final String deskripsi;
  final int harga;
  final int jumlah;
  const CartCard({
    required this.itemTitle,
    required this.deskripsi,
    required this.harga,
    this.jumlah = 0,
    Key? key,
  }) : super(key: key);

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  int _itemCount = 0;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.itemTitle,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 3.0),
        child: Text(
          widget.deskripsi,
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
              'Rp ${widget.harga}',
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
                      onPressed: () {
                        // setState(
                        //     () => _itemCount != 0 ? _itemCount-- : _itemCount);

                        setState(() {
                          _itemCount != 0 ? _itemCount-- : _itemCount;
                        });
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.all(5.0)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black26),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
                      onPressed: () => setState(() => _itemCount++),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.all(5.0)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.cyan),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
