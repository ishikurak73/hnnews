import 'package:hnnews/constants/constants.dart';
import 'package:hnnews/models/story_model.dart';
import 'package:hnnews/services/api_services.dart';
import 'package:hnnews/services/url_services.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:get/get.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<dynamic> getPageItemsFromList(List list, int start, int length) {
  var end = start + length;
  var endPost = end >= list.length ? list.length : end;
  return list.sublist(start, endPost);
}

class StoriesController {
  String url;

  var isLoading = true.obs;
  var storiesIds = <int>[].obs;

  StoriesController({required this.url}) : super();

  final PagingController<int, StoryModel> pagingController =
  PagingController(firstPageKey: 0);

  void onInit() async {
    await fetchStoriesIdsOnInit();
    await fetchStoriesInit();
    pagingController.addPageRequestListener((lastIndex) {
      fetchStoriesOnScroll(lastIndex);
    });
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
    isLoading.value = true;
    storiesIds.value = [];
    pagingController.refresh();
    await fetchStoriesIdsOnInit();
    await fetchStoriesInit();
  }

}

final topStoriesProvider = AutoDisposeProvider(
        (ref) => StoriesController(url: URLService.topStories())..onInit());
final newStoriesProvider = AutoDisposeProvider(
        (ref) => StoriesController(url: URLService.newStories())..onInit());
final bestStoriesProvider = AutoDisposeProvider(
        (ref) => StoriesController(url: URLService.bestStories())..onInit());
final likeStoriesProvider = AutoDisposeProvider(
        (ref) => StoriesController(url: 'like')..onInit());