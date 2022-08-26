import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MyItem {
  bool isExpanded;
  final String header;
  final String body;
  final AssetImage image;
  final String value;
  final double rating;
  MyItem(
      {this.isExpanded = false,
      required this.header,
      required this.body,
      required this.image,
      required this.value,
      required this.rating});
}

class Reservations extends StatefulWidget {
  final DateTime inDate;
  final DateTime outDate;
  final double adults;
  final double children;
  final String extras;
  final String views;
  const Reservations({
    Key? key,
    required this.adults,
    required this.children,
    required this.inDate,
    required this.outDate,
    required this.extras,
    required this.views,
  }) : super(key: key);

  @override
  State<Reservations> createState() => _ReservationsState();
}

class _ReservationsState extends State<Reservations> {
  bool isSelected = false;

  final List<MyItem> _itmes = <MyItem>[
    MyItem(
        image: const AssetImage("images/resort-hero.jpg"),
        header: "Single Room",
        body: "A room assigned to one person",
        value: "single",
        rating: 3),
    MyItem(
        image: const AssetImage("images/resort-hero.jpg"),
        header: "Double Room",
        body: "A room assigned to two people. May have one or more beds.",
        value: "double",
        rating: 4),
    MyItem(
        image: const AssetImage("images/resort-hero.jpg"),
        header: "Suite Room",
        body: "A room with one or more bedrooms and a seperate living space",
        value: "suite",
        rating: 5),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "title",
        home: Scaffold(
            appBar: AppBar(
              title: const Text(
                "Castaway Resort",
                style: TextStyle(fontFamily: "Serif"),
              ),
              backgroundColor: const Color(0xff00BCD4),
              actions: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back))
              ],
            ),
            body: SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(8),
              child: ListView(
                children: <Widget>[
                  ExpansionPanelList(
                    expansionCallback: (int index, bool isExpanded) {
                      setState(() {
                        _itmes[index].isExpanded = !_itmes[index].isExpanded;
                      });
                    },
                    children: _itmes.map<ExpansionPanel>((MyItem item) {
                      return ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            title: Text(
                              item.header,
                              style: const TextStyle(
                                  color: Color(0xff008D9F),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                            leading: Image(image: item.image),
                            trailing: Switch(
                                value: isSelected, onChanged: (isSelected) {}),
                          );
                        },
                        body: ListTile(
                          leading: SizedBox(
                            width: 100,
                            child: RatingBar(
                                itemSize: 20,
                                initialRating: item.rating,
                                ratingWidget: RatingWidget(
                                    full: const Icon(
                                      Icons.star_rate,
                                      color: Colors.orange,
                                    ),
                                    half: const Icon(Icons.star_half),
                                    empty: const Icon(Icons.star_outline)),
                                onRatingUpdate: (rating) {}),
                          ),
                          title: Text(
                            item.body,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                        isExpanded: item.isExpanded,
                      );
                    }).toList(),
                  ),
                  TextButton(
                      onPressed: () {
                        reserve(
                            inDate: widget.inDate,
                            outDate: widget.outDate,
                            children: widget.children,
                            adults: widget.adults,
                            extras: widget.extras,
                            view: widget.views);
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xff008D9F))),
                      child: const Text(
                        "Book Now",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
            ))));
  }

  Future reserve(
      {required DateTime inDate,
      required DateTime outDate,
      required double children,
      required double adults,
      required String extras,
      required String view}) async {
    final docReservation =
        FirebaseFirestore.instance.collection("reservations").doc();

    final json = {
      "check-in": inDate,
      "check-out": outDate,
      "children": children,
      "adults": adults,
      "extras": extras,
      "view": view
    };

    await docReservation.set(json);
  }
}
