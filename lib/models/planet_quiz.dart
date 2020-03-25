class PlanetQuestion {
  String question;
  List<Answer> answer;

  PlanetQuestion({this.question, this.answer});

  PlanetQuestion.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    if (json['answer'] != null) {
      answer = new List<Answer>();
      json['answer'].forEach((v) {
        answer.add(new Answer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question'] = this.question;
    if (this.answer != null) {
      data['answer'] = this.answer.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Answer {
  String option;
  bool isCorrect;

  Answer({this.option, this.isCorrect});

  Answer.fromJson(Map<String, dynamic> json) {
    option = json['option'];
    isCorrect = json['is_correct'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['option'] = this.option;
    data['is_correct'] = this.isCorrect;
    return data;
  }
}

class PlanetQuestionList {
  final List<PlanetQuestion> planetQuizzes;

  PlanetQuestionList({this.planetQuizzes});

  factory PlanetQuestionList.fromJson(List<dynamic> parsedJson) {
    List<PlanetQuestion> planetQuizzes = new List<PlanetQuestion>();
    planetQuizzes = parsedJson.map((i) => PlanetQuestion.fromJson(i)).toList();
    return new PlanetQuestionList(planetQuizzes: planetQuizzes);
  }
}
