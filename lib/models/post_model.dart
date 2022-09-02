class PostModel {
  final int id;
  final String title;
  final String body;

  PostModel(
      {required this.id,
        required this.title,
        required this.body});

  PostModel copyWith({int? id, String? title, String? body}) {
    return PostModel(
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
    );
  }

  factory PostModel.fromJson(dynamic json) => PostModel(
      id: json['id'],
      title: json['title'],
      body: json['body']);
}
