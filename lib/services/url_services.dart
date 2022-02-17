import 'package:hnnews/constants/constants.dart';

class URLService {
  static String storyById(int storyId) {
    return "${Constants.baseURLHN}/item/$storyId.json?print=pretty";
  }

  static String topStories() {
    return "${Constants.baseURLHN}/topstories.json?print=pretty";
  }

  static String newStories() {
    return "${Constants.baseURLHN}/newstories.json?print=pretty";
  }

  static String bestStories() {
    return "${Constants.baseURLHN}/beststories.json";
  }

  static String commentById(int commentId) {
    return "${Constants.baseURLHN}/item/$commentId.json?print=pretty";
  }
}
