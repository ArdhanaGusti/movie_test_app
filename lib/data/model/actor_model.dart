import 'dart:convert';

ActorModel actorModelFromJson(String str) =>
    ActorModel.fromJson(json.decode(str));

String actorModelToJson(ActorModel data) => json.encode(data.toJson());

class ActorModel {
  int page;
  List<Actor> actor;
  int totalPages;
  int totalResults;

  ActorModel({
    required this.page,
    required this.actor,
    required this.totalPages,
    required this.totalResults,
  });

  factory ActorModel.fromJson(Map<String, dynamic> json) => ActorModel(
        page: json["page"],
        actor: List<Actor>.from(json["results"].map((x) => Actor.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(actor.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class Actor {
  bool adult;
  int gender;
  int id;
  // List<Movie> knownFor;
  String name;
  double popularity;
  String profilePath;

  Actor({
    required this.adult,
    required this.gender,
    required this.id,
    // required this.knownFor,
    required this.name,
    required this.popularity,
    required this.profilePath,
  });

  factory Actor.fromJson(Map<String, dynamic> json) => Actor(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        // knownFor:
        //     List<Movie>.from(json["known_for"].map((x) => Movie.fromJson(x))),
        name: json["name"],
        popularity: json["popularity"]?.toDouble(),
        profilePath: json["profile_path"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "gender": gender,
        "id": id,
        // "known_for": List<dynamic>.from(knownFor.map((x) => x.toJson())),
        "name": name,
        "popularity": popularity,
        "profile_path": profilePath,
      };
}

class ActorDetail {
  bool adult;
  List<dynamic> alsoKnownAs;
  String biography;
  DateTime birthday;
  dynamic deathday;
  int gender;
  dynamic homepage;
  int id;
  String imdbId;
  String knownForDepartment;
  String name;
  String placeOfBirth;
  double popularity;
  String profilePath;

  ActorDetail({
    required this.adult,
    required this.alsoKnownAs,
    required this.biography,
    required this.birthday,
    this.deathday,
    required this.gender,
    this.homepage,
    required this.id,
    required this.imdbId,
    required this.knownForDepartment,
    required this.name,
    required this.placeOfBirth,
    required this.popularity,
    required this.profilePath,
  });

  factory ActorDetail.fromJson(Map<String, dynamic> json) => ActorDetail(
        adult: json["adult"],
        alsoKnownAs: List<dynamic>.from(json["also_known_as"].map((x) => x)),
        biography: json["biography"],
        birthday: DateTime.parse(json["birthday"]),
        deathday: json["deathday"],
        gender: json["gender"],
        homepage: json["homepage"],
        id: json["id"],
        imdbId: json["imdb_id"] ?? "",
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        placeOfBirth: json["place_of_birth"],
        popularity: json["popularity"]?.toDouble(),
        profilePath: json["profile_path"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "also_known_as": List<dynamic>.from(alsoKnownAs.map((x) => x)),
        "biography": biography,
        "birthday":
            "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}",
        "deathday": deathday,
        "gender": gender,
        "homepage": homepage,
        "id": id,
        "imdb_id": imdbId,
        "known_for_department": knownForDepartment,
        "name": name,
        "place_of_birth": placeOfBirth,
        "popularity": popularity,
        "profile_path": profilePath,
      };
}
