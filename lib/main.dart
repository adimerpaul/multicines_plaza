import 'package:flutter/material.dart';
import 'package:multicines_plaza/screens/menu_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multicines Plaza',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // bottomNavigationBarTheme: BottomNavigationBarThemeData(
        //   backgroundColor: Colors.red,
        //   selectedItemColor: Colors.amber,
        //   unselectedItemColor: Colors.white,
        //   selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        //   unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
        // ),
      ),
      home: const MenuScreen(),
    );
  }
}
