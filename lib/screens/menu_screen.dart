import 'package:flutter/material.dart';
import 'package:multicines_plaza/screens/history/history_screen.dart';
import 'package:multicines_plaza/screens/home/home_screen.dart';
import 'package:multicines_plaza/screens/movie/movie_screen.dart';
import 'package:multicines_plaza/screens/profile/profile_screen.dart';
import 'package:multicines_plaza/screens/promotion/promotion_screen.dart';
import 'package:multicines_plaza/utils/colors.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  var index_color = 0;
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 60,
        width: 60,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                index_color = 4;
              });
            },
            child: Icon(
              Icons.shopping_cart,
              color: index_color == 4 ? Colors.white : colorInactive,
            ),
            backgroundColor: Colors.purple,
            shape: const CircleBorder(),
            elevation: 2.0,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        height: 65,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  index_color = 0;
                });
              },
              child: Column(
                children: [
                  Icon(
                    index_color == 0 ? Icons.home : Icons.home_outlined,
                    color: index_color == 0 ? colorActive : colorInactive,
                  ),
                  Text(
                    'Inicio',
                    style: TextStyle(
                      color: index_color == 0 ? colorActive : colorInactive,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  index_color = 1;
                });
              },
              child: Column(
                children: [
                  Icon(
                    index_color == 1 ? Icons.movie : Icons.movie_outlined,
                    color: index_color == 1 ? colorActive : colorInactive,
                  ),
                  Text(
                    'Peliculas',
                    style: TextStyle(
                      color: index_color == 1 ? colorActive : colorInactive,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 0,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  index_color = 2;
                });
              },
              child: Column(
                children: [
                  Icon(
                    index_color == 2 ? Icons.person : Icons.person_outline,
                    color: index_color == 2 ? colorActive : colorInactive,
                  ),
                  Text(
                    'Perfil',
                    style: TextStyle(
                      color: index_color == 2 ? colorActive : colorInactive,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  index_color = 3;
                });
              },
              child: Column(
                children: [
                  Icon(
                    index_color == 3 ? Icons.local_offer : Icons.local_offer_outlined,
                    color: index_color == 3 ? colorActive : colorInactive,
                  ),
                  Text(
                    'Promos',
                    style: TextStyle(
                      color: index_color == 3 ? colorActive : colorInactive,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
