// To parse this JSON data, do
//
//     final commentModel = commentModelFromJson(jsonString);

import 'dart:convert';

CommentModel commentModelFromJson(String str) =>
    CommentModel.fromJson(json.decode(str));

String commentModelToJson(CommentModel data) => json.encode(data.toJson());

class CommentModel {
  CommentModel({
    required this.by,
    required this.id,
    required this.kids,
    required this.parent,
    required this.text,
    required this.time,
    required this.type,
  });

  String by;
  int id;
  List<int> kids;
  int parent;
  String text;
  int time;
  String type;

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        by: json["by"],
        id: json["id"],
        kids: List<int>.from(json["kids"].map((x) => x)),
        parent: json["parent"],
        text: json["text"],
        time: json["time"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "by": by,
        "id": id,
        "kids": List<dynamic>.from(kids.map((x) => x)),
        "parent": parent,
        "text": text,
        "time": time,
        "type": type,
      };
}
