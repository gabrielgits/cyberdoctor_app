class ProblemModel {
  String title;
  String category;
  String author;
  int id;

  ProblemModel({
    required this.title,
    required this.category,
    required this.author,
    required this.id,
  });

  factory ProblemModel.fromJson(Map<String, dynamic> json) {
    return ProblemModel(
      title: json['title'],
      category: json['category'],
      author: json['author'],
      id: json['id'],
    );
  }

  Map<String, dynamic> body() {
    return {'title': title, 'category': category, 'author': author, 'id': id};
  }
}
