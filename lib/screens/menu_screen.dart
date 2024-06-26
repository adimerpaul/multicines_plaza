import 'package:flutter/material.dart';
import 'package:multicines_plaza/screens/history_screen.dart';
import 'package:multicines_plaza/screens/home_screen.dart';
import 'package:multicines_plaza/screens/movie_screen.dart';
import 'package:multicines_plaza/screens/profile_screen.dart';
import 'package:multicines_plaza/screens/promotion_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  var index_color=0;
  List pages = [
    HomeScreen(),
    MovieScreen(),
    ProfileScreen(),
    PromotionScreen(),
    HistoryScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index_color],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        currentIndex: index_color,
        onTap: (index) {
          setState(() {
            index_color = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Promotions',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.history),
          //   label: 'History',
          // ),
        ],
      ),
    );
  }
}
