import 'package:assignment_3/reservation.dart';
import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String appBarTitle = "Castaway Resort";

  double adults = 1;
  double children = 0;

  List<String> extras = ["breakfast", "wifi", "parking"];
  List<String> views = ["garden", "sea"];

  CustomGroupController extrasController =
      CustomGroupController(isMultipleSelection: true);

  String extrasTitle(int index) {
    String title = "";
    switch (index) {
      case 0:
        title = "Breakfast (50EGP/Day)";
        break;
      case 1:
        title = "Internet Wifi (50EGP/Day)";
        break;
      case 2:
        title = "Parking (100EGP/Day)";
        break;
      default:
    }
    return title;
  }

  String viewTitle(int index) {
    String title = "";
    switch (index) {
      case 0:
        title = "Garden View";
        break;
      case 1:
        title = "Sea View";
        break;
      default:
    }
    return title;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Homepage",
        home: Scaffold(
            appBar: AppBar(
              title: Text(
                appBarTitle,
                style: const TextStyle(fontFamily: "Serif"),
              ),
              backgroundColor: const Color(0xff00BCD4),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ListView(children: [
                  Column(children: [
                    Image(
                      image: const AssetImage("images/resort-hero.jpg"),
                      width: MediaQuery.of(context).size.width - 16,
                    ),
                    Row(
                      //Check In
                      children: [
                        const Text(
                          "Check-in Date:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff008D9F)),
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.calendar_month_outlined)),
                        const Text(
                          "2022-2-1",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff008D9F)),
                        )
                      ],
                    ),
                    Row(
                      //Check out
                      children: [
                        const Text(
                          "Check-out Date:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff008D9F)),
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.calendar_month_outlined)),
                        const Text(
                          "2022-2-1",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff008D9F)),
                        )
                      ],
                    ),
                    Row(
                      //Adults
                      children: [
                        const Text(
                          "Number of Adults:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff008D9F)),
                        ),
                        const SizedBox(width: 20),
                        SizedBox(
                            width: 150,
                            child: Slider(
                              value: adults,
                              onChanged: (double newAdults) {
                                setState(() {
                                  adults = newAdults;
                                });
                              },
                              label: adults.round().toString(),
                              min: 1.0,
                              max: 5.0,
                              divisions: 5,
                            )),
                        Text(
                          adults.round().toString(),
                          style: const TextStyle(
                              color: Color(0xff008D9F),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      //childern
                      children: [
                        const Text(
                          "Number of children:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff008D9F)),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                            width: 150,
                            child: Slider(
                              value: children,
                              onChanged: (double newChildren) {
                                setState(() {
                                  children = newChildren;
                                });
                              },
                              label: children.round().toString(),
                              min: 0.0,
                              max: 5.0,
                              divisions: 5,
                            )),
                        Text(
                          children.round().toString(),
                          style: const TextStyle(
                              color: Color(0xff008D9F),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    //Extras
                    Row(
                      children: const [
                        Text(
                          "Extras:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff008D9F)),
                        ),
                      ],
                    ),
                    CustomGroupedCheckbox<String>(
                      controller: extrasController,
                      itemBuilder: (context, index, checked, isDisabled) {
                        return Row(children: <Widget>[
                          Checkbox(value: checked, onChanged: (ara) {}),
                          Text(extrasTitle(index))
                        ]);
                      },
                      values: extras,
                    ),
                    Row(
                      children: const [
                        Text(
                          "View:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff008D9F)),
                        ),
                      ],
                    ),
                    CustomGroupedCheckbox<String>(
                      controller: extrasController,
                      itemBuilder: (context, index, checked, isDisabled) {
                        return Row(children: <Widget>[
                          Checkbox(value: checked, onChanged: (ara) {}),
                          Text(viewTitle(index))
                        ]);
                      },
                      values: views,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Reservations()));
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff008D9F))),
                        child: const Text(
                          "Check Rooms and Rates",
                          style: TextStyle(color: Colors.white),
                        ))
                  ]),
                ]),
              ),
            )));
  }
}
