import 'package:get/state_manager.dart';
import 'package:hnnews/constants/constants.dart';
import 'package:hnnews/models/story_model.dart';
import 'package:hnnews/services/api_services.dart';
import 'package:hnnews/services/url_services.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

List<dynamic> getPageItemsFromList(List list, int start, int length) {
  var end = start + length;
  var endPost = end >= list.length ? list.length : end;
  return list.sublist(start, endPost);
}

class StoriesController extends GetxController {
  String url;

  var isLoading = true.obs;
  var storiesIds = <int>[].obs;

  StoriesController({required this.url}) : super();

  final PagingController<int, StoryModel> pagingController =
      PagingController(firstPageKey: 0);

  @override
  void onInit() async {
    await fetchStoriesIdsOnInit();
    await fetchStoriesInit();
    pagingController.addPageRequestListener((lastIndex) {
      fetchStoriesOnScroll(lastIndex);
    });
    super.onInit();
  }

  fetchStoriesIdsOnInit() async {
    try {
      storiesIds.value = await fetchStoryByURL(url);
    } finally {
      isLoading(true);
    }
  }

  fetchStoriesInit() async {
    try {
      var ids = getPageItemsFromList(storiesIds.value, 0, pageSize);
      var stories = await fetchStoryByIds(ids);
      pagingController.appendPage(stories, stories.length);
    } finally {
      isLoading(true);
    }
  }

  fetchStoriesOnScroll(int lastIndex) async {
    if (lastIndex == 0) return;

    var ids = getPageItemsFromList(storiesIds.value, lastIndex, pageSize);

    try {
      var stories = await fetchStoryByIds(ids);

      final isLastPage = stories.length + lastIndex >= storiesIds.length;
      if (isLastPage) {
        pagingController.appendLastPage(stories);
      } else {
        pagingController.appendPage(stories, lastIndex + pageSize);
      }
    } finally {
      // isLoading(false);
    }
  }

  onRefresh() async {
    print("onRefresh");
    isLoading.value = true;
    storiesIds.value = [];
    pagingController.refresh();
    await fetchStoriesIdsOnInit();
    await fetchStoriesInit();
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }
}

class TopStoriesController extends StoriesController {
  TopStoriesController() : super(url: URLService.topStories());
}

class NewStoriesController extends StoriesController {
  NewStoriesController() : super(url: URLService.newStories());
}

class BestStoriesController extends StoriesController {
  BestStoriesController() : super(url: URLService.bestStories());
}

class LikesStoriesController extends StoriesController {
  LikesStoriesController() : super(url: "none");

  get box => null;

  @override
  fetchStoriesIdsOnInit() async {
    try {
      storiesIds.value = await box.read(likeStories);
    } finally {
      isLoading(true);
    }
  }
}
