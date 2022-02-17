import 'dart:convert';

StoryModel storyModelFromJson(String str) =>
    StoryModel.fromJson(json.decode(str));

String storyModelToJson(StoryModel data) => json.encode(data.toJson());

class StoryModel {
  StoryModel({
    required this.by,
    this.descendants,
    required this.id,
    required this.kids,
    required this.score,
    required this.time,
    required this.title,
    required this.type,
    this.url,
  });

  String by;
  int? descendants;
  int id;
  List<int> kids;
  int score;
  int time;
  String title;
  String type;
  String? url;

  factory StoryModel.fromJson(Map<String, dynamic> json) => StoryModel(
        by: json["by"],
        descendants: json["descendants"],
        id: json["id"],
        kids: List<int>.from(json["kids"] ?? [].map((x) => x)),
        score: json["score"],
        time: json["time"],
        title: json["title"],
        type: json["type"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "by": by,
        "descendants": descendants,
        "id": id,
        "kids": List<dynamic>.from(kids.map((x) => x)),
        "score": score,
        "time": time,
        "title": title,
        "type": type,
        "url": url,
      };
}

class StoriesModel {
  StoriesModel({required this.stories});
  List<int> stories;

  factory StoriesModel.fromJson(List<dynamic> json) => StoriesModel(
        stories: List<int>.from(json.map((x) => x)),
      );
}
