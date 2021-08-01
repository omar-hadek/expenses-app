import 'package:expenses_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //  DeviceOrientation.portraitUp,
  //  DeviceOrientation.portraitDown,
  // ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expenses traking',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.yellowAccent,
      ),
      home:HomeScreen(),
    );
  }
}
