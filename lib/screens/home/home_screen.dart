import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:multicines_plaza/utils/colors.dart';

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
      appBar: AppBar(
        title: const Text('Inicio', style: TextStyle(color: colorActive, fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: bgColor,
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

class CategorySection extends StatelessWidget {
  final String title;
  final List<String> items;

  const CategorySection({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(items[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
