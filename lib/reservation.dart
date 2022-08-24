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
  /* final double adults;
  final double children; */
  const Reservations({Key? key}) : super(key: key);

  @override
  State<Reservations> createState() => _ReservationsState();
}

bool isSelected = false;

class _ReservationsState extends State<Reservations> {
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
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xff008D9F))),
                      child: const Text(
                        "Book Now",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ))));
  }
}
