import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:multicines_plaza/utils/colors.dart';
import 'package:multicines_plaza/widgets/category_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imgList = [
    'https://via.placeholder.com/600x400?text=Movie+1',
    'https://via.placeholder.com/600x400?text=Movie+2',
    'https://via.placeholder.com/600x400?text=Movie+3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0), // Altura del AppBar
        child: AppBar(
          flexibleSpace: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('https://www.shutterstock.com/image-vector/elegant-purple-stage-horizontal-glowing-600nw-2345772453.jpg'),
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
                      'Multicines Plaza',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Bienvenido a tu cine favorito',
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
        ),
      ),
      body: Container(
        color: bgSecondaryColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: imgList.map((item) => Container(
                  child: Center(
                    child: Image.network(item, fit: BoxFit.cover, width: 1000),
                  ),
                )).toList(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Categorías',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              CategorySection(
                title: 'Películas en Cartelera',
                items: [
                  'https://via.placeholder.com/150x200?text=Movie+1',
                  'https://via.placeholder.com/150x200?text=Movie+2',
                  'https://via.placeholder.com/150x200?text=Movie+3',
                ],
              ),
              CategorySection(
                title: 'Próximos Estrenos',
                items: [
                  'https://via.placeholder.com/150x200?text=Coming+Soon+1',
                  'https://via.placeholder.com/150x200?text=Coming+Soon+2',
                  'https://via.placeholder.com/150x200?text=Coming+Soon+3',
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Acceso Rápido',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to Cartelera
                    },
                    child: Text('Cartelera'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to Promociones
                    },
                    child: Text('Promociones'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to Perfil
                    },
                    child: Text('Perfil'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

