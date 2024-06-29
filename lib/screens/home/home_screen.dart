import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:multicines_plaza/addons/text.dart';
import 'package:multicines_plaza/models/movie.dart';
import 'package:multicines_plaza/screens/history/header_screen.dart';
import 'package:multicines_plaza/services/api_service.dart';
import 'package:multicines_plaza/utils/colors.dart';
import 'package:multicines_plaza/widgets/category_section.dart';
import 'package:multicines_plaza/widgets/movie_detail_screen.dart';


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
  final List<Movie> movies = [];

  @override
  void initState() {
    super.initState();
    init();
  }
  Future init() async {
    List res = await ApiService().moviesGet();
    final url = dotenv.env['API_BACK']?? '';
    // print(res);
    imgList.clear();
    res.forEach((element) {
      final urlImg = url + '/../../imagen/'+ element['imagen'];
      element['imagen'] = urlImg;
      imgList.add(urlImg);
      movies.add(Movie.fromJson(element));
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0), // Altura del AppBar
        child: HeaderScreen(
          title: 'Multicines Plaza',
          subtitle: '¡Disfruta de las mejores películas!',
        ),
      ),
      body: Container(
        color: bgSecondaryColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (movies.isNotEmpty)
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                  ),
                  items: movies.map((movie) {
                    return GestureDetector(
                      onTap: () {
                        // Navegar a la pantalla de detalles de la película
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetailScreen(movie: movie),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          Container(
                            child: Center(
                              child: Image.network(movie.imagen, fit: BoxFit.cover, width: 1000),
                            ),
                          ),
                          // Positioned(
                          //   top: 8.0,
                          //   right: 8.0,
                          //   child: Container(
                          //     color: Colors.black54,
                          //     padding: const EdgeInsets.all(4.0),
                          //     child: Text(
                          //       'Disponible: ${movie.disponible}',
                          //       style: TextStyle(color: Colors.white),
                          //     ),
                          //   ),
                          // ),
                          Positioned(
                            bottom: 8.0,
                            left: 8.0,
                            child: Container(
                              color: Colors.black54,
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                children: [
                                  Text(
                                      capitalize(movie.nombre),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold
                                      )
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
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

