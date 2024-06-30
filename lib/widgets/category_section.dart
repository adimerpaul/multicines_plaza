import 'package:flutter/material.dart';
import 'package:multicines_plaza/models/movie.dart';

class CategorySection extends StatelessWidget {
  final String title;
  final List<Movie> items;
  final void Function(Movie)? onClick;


  const CategorySection({
    required this.title,
    required this.items,
    this.onClick,
  });

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
                return GestureDetector(
                  onTap: () {
                    // print('Tapped on ${items[index].original_title}');
                    onClick!(items[index]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(items[index].poster_path!),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}