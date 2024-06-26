class Movie {
  final int id;
  final String nombre;
  final int duracion;
  final String formato;
  final String imagen;
  final int cantidadUsada;
  final int capacidadSala;
  final int disponible;

  Movie({
    required this.id,
    required this.nombre,
    required this.duracion,
    required this.formato,
    required this.imagen,
    required this.cantidadUsada,
    required this.capacidadSala,
    required this.disponible,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      nombre: json['nombre'],
      duracion: json['duracion'],
      formato: json['formato'],
      imagen: json['imagen'],
      cantidadUsada: json['cantidad_usada'],
      capacidadSala: json['capacidad_sala'],
      disponible: json['disponible'],
    );
  }
}