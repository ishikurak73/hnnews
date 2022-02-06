// To parse this JSON data, do
//
//     final topStoriesModel = topStoriesModelFromJson(jsonString);

import 'dart:convert';

List<int> topStoriesModelFromJson(String str) =>
    List<int>.from(json.decode(str).map((x) => x));

String topStoriesModelToJson(List<int> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));
