// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, sized_box_for_whitespace

import 'package:event_hunter/models/event_model.dart';
import 'package:event_hunter/providers/event_provider.dart';
import 'package:event_hunter/ui/pages/detail_event_page.dart';
import 'package:event_hunter/ui/pages/preview_event_page.dart';
import 'package:event_hunter/ui/widgets/destination_tile.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../shared/theme.dart';

class ExploreEventPage extends StatefulWidget {
  const ExploreEventPage({Key? key}) : super(key: key);

  @override
  State<ExploreEventPage> createState() => _ExploreEventPageState();
}

class _ExploreEventPageState extends State<ExploreEventPage> {
  TextEditingController searchController = TextEditingController();

  String terima = '';

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // await Provider.of<EventProvider>(context, listen: false).getEvents();

      await Provider.of<EventProvider>(context, listen: false)
          .getEventsFromAPI(nama: terima);

      // await Provider.of<AuthProvider>(context, listen: false).getUserActive();
    });
  }

  @override
  Widget build(BuildContext context) {
    searchController.text = terima;
    var args = ModalRoute.of(context)?.settings.arguments as String;
    setState(() {
      terima = args;
      print('Hasil terima : ${terima}');
    });

    EventProvider eventProvider = Provider.of<EventProvider>(context);
    Widget search() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        padding: EdgeInsets.only(left: 15, top: 0, right: 5, bottom: 0),
        // height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            width: 1.5,
            color: primaryColor,
          ),
        ),
        child: TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: 'Looking another location...',
            hintStyle: secondaryTextStyle.copyWith(
              fontWeight: medium,
            ),
            border: InputBorder.none,
            suffixIcon: IconButton(
              onPressed: () {
                eventProvider.getEventsFromAPI(nama: searchController.text);
              },
              icon: Container(
                // width: 60,
                // height: 60,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryColor,
                ),
                child: Icon(
                  Icons.search,
                  color: whiteColor,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xffFaFaFa),
      body: Container(
        // color: Colors.amber,
        margin: EdgeInsets.fromLTRB(20, 35, 20, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      print('Back');
                      Navigator.pop(context);
                      Navigator.pushNamedAndRemoveUntil(
                          context, "/home", (route) => false);
                    },
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffF4FFFE),
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: Color(0xff32B0C7),
                      ),
                    ),
                  ),
                  Text(
                    'Explore Event',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  SizedBox(
                    width: 32,
                    height: 32,
                  ),
                ],
              ),
            ),
            search(),
            Expanded(
              child: Container(
                // color: Colors.amber,
                margin: EdgeInsets.only(bottom: 50),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 180 / 330,
                      crossAxisSpacing: 25,
                      mainAxisSpacing: 25,
                      crossAxisCount: 2,
                    ),
                    itemCount: eventProvider.events.length,
                    itemBuilder: (context, index) {
                      EventModel event = eventProvider.events[index];
                      return DestinationTile(
                        imgThumbnail: event.image,
                        name: event.nama,
                        price: event.harga,
                        onTap: () {
                          print(event.nama);

                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) {
                          //       return DetailEventPage(eventModel: event);
                          //     },
                          //   ),
                          // );
                          Navigator.of(context).push(
                            PageTransition(
                              child: DetailEventPage(eventModel: event),
                              type: PageTransitionType.rightToLeft,
                            ),
                          );
                        },
                        onLongPress: () {
                          print('tekan lama');
                          print(event.nama);
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Preview'),
                                content: Container(
                                  height: 290,
                                  child: PreviewEventPage(
                                    eventModel: event,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}





// note : untuk pindah halaman ke detail screen

// Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) {
//                                 return DestinationDetailsScreen(
//                                     destination: destination);
//                               },
//                             ),
//                           );








// note : untuk add new data to List saat menakan tombol
// setState(() {
//                             destinationList.add(
//                               Destination(
//                                 imgThumbnail:
//                                     'https://s3-ap-southeast-1.amazonaws.com/loket-production-sg/images/banner/20220308105648_6226d400419fb.jpg',
//                                 name:
//                                     'Gangga I\'ts Never Easy Tour - YOGYAKARTA',
//                                 price: '125.000',
//                               ),
//                             );
//                           });