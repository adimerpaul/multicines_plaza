class Movie {
  final bool? adult;
  final String? backdrop_path;
  final String? belongs_to_collection;
  final int? budget;
  final List<dynamic>? genres;
  final String? homepage;
  final int? id;
  final String? imdb_id;
  final List<String>? origin_country;
  final String? original_language;
  final String? original_title;
  final String? overview;
  final double? popularity;
  final String? poster_path;
  final List<dynamic>? production_companies;
  final List<dynamic>? production_countries;
  final String? release_date;
  final int? revenue;
  final int? runtime;
  final List<dynamic>? spoken_languages;
  final String? status;
  final String? tagline;
  final String? title;
  final bool? video;
  final double? vote_average;
  final int? vote_count;

  Movie({
    required this.adult,
    this.backdrop_path,
    this.belongs_to_collection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdb_id,
    this.origin_country,
    this.original_language,
    this.original_title,
    this.overview,
    this.popularity,
    this.poster_path,
    this.production_companies,
    this.production_countries,
    this.release_date,
    this.revenue,
    this.runtime,
    this.spoken_languages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.vote_average,
    this.vote_count,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      adult: json['adult'],
      backdrop_path: json['backdrop_path'],
      belongs_to_collection: json['belongs_to_collection'],
      budget: json['budget'],
      genres: json['genres'],
      homepage: json['homepage'],
      id: json['id'],
      imdb_id: json['imdb_id'],
      origin_country: json['origin_country'],
      original_language: json['original_language'],
      original_title: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      poster_path: json['poster_path'],
      production_companies: json['production_companies'],
      production_countries: json['production_countries'],
      release_date: json['release_date'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      spoken_languages: json['spoken_languages'],
      status: json['status'],
      tagline: json['tagline'],
      title: json['title'],
      video: json['video'],
      vote_average: json['vote_average'],
      vote_count: json['vote_count'],
    );
  }
}
