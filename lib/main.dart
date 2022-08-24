import 'package:assignment_3/home.dart' as home;
import 'package:assignment_3/reservation.dart' as reservation;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    routes: {
      "/": (context) => home.HomePage(),
      /* "/reservation": (context) => const reservation.Reservations() */
    },
    initialRoute: "/",
  ));
}
