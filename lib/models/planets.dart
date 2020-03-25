class Planet {
  String planet;
  String image;
  String description;
  List<String> links;

  Planet({this.planet, this.image, this.description, this.links});

  Planet.fromJson(Map<String, dynamic> json) {
    planet = json['planet'];
    image = json['image'];
    description = json['description'];
    links = json['links'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['planet'] = this.planet;
    data['image'] = this.image;
    data['description'] = this.description;
    data['links'] = this.links;
    return data;
  }
}

class PlanetList {
  final List<Planet> planets;

  PlanetList({this.planets});

  factory PlanetList.fromJson(List<dynamic> parsedJson) {
    List<Planet> planets = new List<Planet>();
    planets = parsedJson.map((i) => Planet.fromJson(i)).toList();
    return new PlanetList(planets: planets);
  }
}
