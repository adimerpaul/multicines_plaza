import 'package:flutter/material.dart';
import 'package:multicines_plaza/models/movie.dart';

class MovieDetailScreen extends StatefulWidget {
  final Movie movie;
  const MovieDetailScreen({
    super.key,
    required this.movie,
  });

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.original_title!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image.network(widget.movie.imagen, fit: BoxFit.cover, width: double.infinity),
            // SizedBox(height: 16.0),
            // Text(
            //   'Nombre: ${widget.movie.nombre}',
            //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            // ),
            // SizedBox(height: 8.0),
            // Text('Duración: ${widget.movie.duracion} minutos'),
            // SizedBox(height: 8.0),
            // Text('Formato: ${widget.movie.formato}'),
            // SizedBox(height: 8.0),
            // Text('Capacidad de Sala: ${widget.movie.capacidadSala}'),
            // SizedBox(height: 8.0),
            // Text('Cantidad Usada: ${widget.movie.cantidadUsada}'),
            // SizedBox(height: 8.0),
            // Text('Disponible: ${widget.movie.disponible}'),
          ],
        ),
      ),
    );
  }
}
