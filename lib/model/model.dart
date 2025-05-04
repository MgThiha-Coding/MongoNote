import 'package:mongo_dart/mongo_dart.dart';

class Model {
  String? title;
  String? content;
  String? time;
  ObjectId? id;

  Model({
    required this.title,
    required this.content,
    required this.time,
    this.id, // don't require id for new documents
  });

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      time: json['time'],
      id: json['_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'content': content, 'time': time, '_id': id};
  }
}
