import 'package:get/state_manager.dart';
import 'package:hnnews/models/story_model.dart';
import 'package:hnnews/services/api_services.dart';

class TopStoriesController extends GetxController {
  var isLoading = true.obs;
  var topStories = <StoryModel>[].obs;

  @override
  void onInit() {
    // fetchTopStories();
    super.onInit();
  }

  fetchStories() async {
    try {
      isLoading(true);
      var ids = await fetchTopStories();
      if (ids != null) {
        topStories.value = ids;
      }
    } finally {
      isLoading(false);
    }
  }
}
