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
        title: Text(widget.movie.original_title ?? 'Movie Details'),
        // backgroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          if (widget.movie.backdrop_path != null)
            Image.network(
              'https://image.tmdb.org/t/p/w500${widget.movie.backdrop_path}',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200.0,
            ),
          const SizedBox(height: 16.0),
          Text(
            widget.movie.title ?? '',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: const Text(
                  'On Trending',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(width: 8.0),
              Text(
                '${widget.movie.vote_average?.toString() ?? ''} ⭐',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const Icon(Icons.share, color: Colors.white),
              const SizedBox(width: 16.0),
              const Icon(Icons.favorite_border, color: Colors.white),
            ],
          ),
          const SizedBox(height: 16.0),
          Text(
            widget.movie.overview ?? '',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text('Play Film', style: TextStyle(fontSize: 18)),
          ),
          const SizedBox(height: 16.0),
          Text(
            'Episodes',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          if (widget.movie.production_companies != null)
            SizedBox(
              height: 100.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.movie.production_companies?.length,
                itemBuilder: (context, index) {
                  final company = widget.movie.production_companies?[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        Image.network(
                          'https://image.tmdb.org/t/p/w200${company['logo_path']}',
                          height: 50.0,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.error, size: 50.0);
                          },
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          company['name'] ?? '',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          // Añadir más secciones según sea necesario
        ],
      ),
      // backgroundColor: Colors.black,
    );
  }
}
