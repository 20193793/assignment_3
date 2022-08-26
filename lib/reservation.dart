import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
  bool singleSelected = false;
  bool doubleSelected = false;
  bool suiteSelected = false;
  bool singleExpanded = false;
  bool doubleExpanded = false;
  bool suiteSExpanded = false;
  String room = "none";

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
                children: [
                  ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          singleExpanded = !isExpanded;
                        });
                      },
                      children: [
                        ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return ListTile(
                              title: Text(
                                "Single Room",
                                style: const TextStyle(
                                    color: Color(0xff008D9F),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              ),
                              leading: Image(
                                  image: AssetImage("images/resort-hero.jpg")),
                              trailing: Switch(
                                  value: singleSelected,
                                  onChanged: (bool selected) {
                                    setState(() {
                                      room = "single";
                                      singleSelected = selected;
                                      doubleSelected = false;
                                      suiteSelected = false;
                                      print(room);
                                    });
                                  }),
                            );
                          },
                          body: ListTile(
                            leading: SizedBox(
                              width: 100,
                              child: RatingBar(
                                  itemSize: 20,
                                  initialRating: 4,
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
                              "A room assigned for one person",
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                          isExpanded: singleExpanded,
                        )
                      ]),
                  ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          doubleExpanded = !isExpanded;
                        });
                      },
                      children: [
                        ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return ListTile(
                              title: Text(
                                "Double Room",
                                style: const TextStyle(
                                    color: Color(0xff008D9F),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              ),
                              leading: Image(
                                  image: AssetImage("images/resort-hero.jpg")),
                              trailing: Switch(
                                  value: doubleSelected,
                                  onChanged: (bool selected) {
                                    setState(() {
                                      room = "double";
                                      doubleSelected = selected;
                                      singleSelected = false;
                                      suiteSelected = false;
                                      print(room);
                                    });
                                  }),
                            );
                          },
                          body: ListTile(
                            leading: SizedBox(
                              width: 100,
                              child: RatingBar(
                                  itemSize: 20,
                                  initialRating: 4,
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
                              "A room assigned for one person",
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                          isExpanded: doubleExpanded,
                        )
                      ]),
                  ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          suiteSExpanded = !isExpanded;
                        });
                      },
                      children: [
                        ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return ListTile(
                              title: Text(
                                "Suite Room",
                                style: const TextStyle(
                                    color: Color(0xff008D9F),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              ),
                              leading: Image(
                                  image: AssetImage("images/resort-hero.jpg")),
                              trailing: Switch(
                                  value: suiteSelected,
                                  onChanged: (bool selected) {
                                    setState(() {
                                      room = "suite";
                                      suiteSelected = selected;
                                      singleSelected = false;
                                      doubleSelected = false;
                                      print(room);
                                    });
                                  }),
                            );
                          },
                          body: ListTile(
                            leading: SizedBox(
                              width: 100,
                              child: RatingBar(
                                  itemSize: 20,
                                  initialRating: 4,
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
                              "A room assigned for one person",
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                          isExpanded: suiteSExpanded,
                        )
                      ]),
                  TextButton(
                      onPressed: () {
                        reserve(
                            inDate: widget.inDate,
                            outDate: widget.outDate,
                            children: widget.children,
                            adults: widget.adults,
                            extras: widget.extras,
                            view: widget.views,
                            room: room);
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
            ),
          ),
        ));
  }

  Future reserve({
    required DateTime inDate,
    required DateTime outDate,
    required double children,
    required double adults,
    required String extras,
    required String view,
    required String room,
  }) async {
    final docReservation =
        FirebaseFirestore.instance.collection("reservations").doc();

    final json = {
      "check-in": inDate,
      "check-out": outDate,
      "children": children,
      "adults": adults,
      "extras": extras,
      "view": view,
      "room": room
    };

    await docReservation.set(json);
  }
}
