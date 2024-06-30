import 'package:flutter/material.dart';

class HeaderScreen extends StatefulWidget {
  final String title;
  final String subtitle;
  const HeaderScreen({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  State<HeaderScreen> createState() => _HeaderScreenState();
}

class _HeaderScreenState extends State<HeaderScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                // image: NetworkImage('https://www.shutterstock.com/image-vector/elegant-purple-stage-horizontal-glowing-600nw-2345772453.jpg'),
                image: AssetImage('assets/title.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.5), // Fondo con opacidad para mejor visibilidad del texto
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  widget.subtitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.transparent, // Fondo transparente para ver la imagen
    );
  }
}
