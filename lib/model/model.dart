import 'package:mongo_dart/mongo_dart.dart';

class Model {
  String? title;
  String? content;
  DateTime? time;
  ObjectId? id;

  Model({
    required this.title,
    required this.content,
    required this.time,
    required this.id,
  });

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      time: json['time'] != null ? (json['time'] as DateTime) : null,
      id:
          json['_id'] is ObjectId
              ? json['_id']
              : ObjectId.fromHexString(json['_id']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'content': content, 'time': time, '_id': id};
  }
}
