import '_export_model.dart';

class FilmsModel {
  int? id;
  String? title;
  int? episode;
  String? openingCrawl;
  String? director;
  String? producer;
  List<PlanetsModel>? planet;
  String? image;

  FilmsModel({
    this.id,
    this.title,
    this.episode,
    this.openingCrawl,
    this.director,
    this.producer,
    this.planet,
    this.image,
  });

  factory FilmsModel.fromMap(Map<String, dynamic> map) => FilmsModel(
        id: map['id'],
        title: map['title'],
        episode: map['episode_id'],
        openingCrawl: map['opening_crawl'],
        director: map['director'],
        producer: map['producer'],
        planet: map['planets']?.map<FilmsModel>((planet) => FilmsModel.fromMap(planet)).toList(),
        image: map['url'],
      );
}
