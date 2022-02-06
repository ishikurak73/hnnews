import 'package:hnnews/constants/hn_constants.dart';

class HNService {
  static String storyById(int storyId) {
    return "${HNConstants.baseURL}/item/$storyId.json?print=pretty";
  }

  static String topStories() {
    return "${HNConstants.baseURL}/topstories.json?print=pretty";
  }

  static String newStories() {
    return "${HNConstants.baseURL}/newstories.json?print=pretty";
  }

  static String bestStories() {
    return "${HNConstants.baseURL}/beststories.json";
  }

  static String commentById(int commentId) {
    return "${HNConstants.baseURL}/item/$commentId.json?print=pretty";
  }
}
