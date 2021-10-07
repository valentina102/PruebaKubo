import 'package:flutter/material.dart';
import 'package:prueba_kubo/pages/home.dart';
import 'package:prueba_kubo/utils/preference.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preference().initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plaza',
      home: HomePage()
    );
  }
}



