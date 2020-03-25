class Quiz {
  String title;
  String planet;
  String description;
  String image;
  List<String> links;

  Quiz({this.title, this.planet, this.description, this.image, this.links});

  Quiz.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    planet = json['planet'];
    description = json['description'];
    image = json['image'];
    links = json['links'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['planet'] = this.planet;
    data['description'] = this.description;
    data['image'] = this.image;
    data['links'] = this.links;
    return data;
  }
}

class QuizzesList {
  final List<Quiz> quizzes;

  QuizzesList({this.quizzes});

  factory QuizzesList.fromJson(List<dynamic> parsedJson) {
    List<Quiz> quizzes = new List<Quiz>();
    quizzes = parsedJson.map((i) => Quiz.fromJson(i)).toList();
    return new QuizzesList(quizzes: quizzes);
  }
}
