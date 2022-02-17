import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hnnews/services/url_services.dart';
import 'package:hnnews/models/story_model.dart';

Future<List<StoryModel>> fetchTopStories() async {
  var result = <StoryModel>[];
  final res = await http.get(
    Uri.parse(URLService.topStories()),
  );
  if (res.statusCode == 200) {
    var data = StoriesModel.fromJson(jsonDecode(res.body));

    data.stories.map((id) async {
      var storyData = await fetchStoryByID(id);
      print(storyData);
      result.add(storyData);
    });

    return result;
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
