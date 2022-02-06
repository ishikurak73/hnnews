// To parse this JSON data, do
//
//     final newStoriesModel = newStoriesModelFromJson(jsonString);

import 'dart:convert';

List<int> newStoriesModelFromJson(String str) =>
    List<int>.from(json.decode(str).map((x) => x));

String newStoriesModelToJson(List<int> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));
