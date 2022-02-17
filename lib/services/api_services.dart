import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hnnews/services/url_services.dart';
import 'package:hnnews/models/story_model.dart';

Future<List<int>> fetchStoryIds(String url) async {
  final res = await http.get(
    Uri.parse(url),
  );
  if (res.statusCode == 200) {
    var data = StoriesModel.fromJson(jsonDecode(res.body));
    return data.stories;
  } else {
    throw Exception('fetchStoryIds failed');
  }
}

Future<List<StoryModel>> fetchOneStories(Iterable stories) async {
  if (stories.isNotEmpty) {
    return Future.wait(stories.map((storyId) {
      return fetchStoryByID(storyId);
    }));
  } else {
    throw Exception('top stories fetch failed');
  }
}

Future<StoryModel> fetchStoryByID(int id) async {
  final res = await http.get(
    Uri.parse(URLService.storyById(id)),
  );
  if (res.statusCode == 200) {
    return StoryModel.fromJson(jsonDecode(res.body));
  } else {
    throw Exception('Fail to Fetch fetchStoryByID');
  }
}
