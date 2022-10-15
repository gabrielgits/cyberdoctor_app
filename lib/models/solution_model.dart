
class SolutionModel {
  String solution;
  String author;
  int id;

  SolutionModel({
    required this.solution,
    required this.author,
    required this.id,
  });

  factory SolutionModel.fromJson(Map<String, dynamic> json) {
    return SolutionModel(
      solution: json['solution'],
      author: json['author'],
      id: json['id'],
    );
  }

  Map<String, dynamic> body() {
    return {'solution': solution, 'author': author, 'id': id};
  }
}
