import 'package:event_hunter/models/ticket_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/ticket_provider.dart';

class CartCard extends StatefulWidget {
  // final String title;
  final Tikets tiket;
  const CartCard({
    required this.tiket,
  });

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  // int _itemCount = 0;
  @override
  Widget build(BuildContext context) {
    TicketProvider ticketProvider = Provider.of<TicketProvider>(context);
    return ListTile(
      title: Text(
        widget.tiket.nama,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 3.0),
        child: Text(
          widget.tiket.deskripsi,
        ),
      ),
      onTap: null,
      trailing: _buildTrailingWidget(),
    );
  }

  Widget _buildTrailingWidget() {
    print(widget.tiket.quantity);
    TicketProvider ticketProvider = Provider.of<TicketProvider>(context);
    return Container(
      margin: const EdgeInsets.only(top: 3.0),
      child: FittedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rp ${widget.tiket.harga}',
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
                          widget.tiket.quantity != 0
                              ? ticketProvider.reduceQuantity(widget.tiket)
                              : widget.tiket.quantity;
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
                      onPressed: () => setState(
                          () => ticketProvider.addQuantity(widget.tiket)),
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
                    widget.tiket.quantity.toString(),
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
