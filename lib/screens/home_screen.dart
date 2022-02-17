import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hnnews/constants/constants.dart';
import 'package:hnnews/views/stories_list.dart';
import 'package:hnnews/controllers/topstories_controller.dart';
import 'package:hnnews/views/tab_view.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final topStoriesController = Get.put(TopStoriesController());
  // final double _minValue = 8.0;
  // var _key = GlobalKey<SliverAnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
      length: 3,
      child: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) => <Widget>[
            SliverAppBar(
              pinned: true,
              leading: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () async {
                  // var ids = await topStoriesController.fetchStories();
                  // print("ids");
                  // Get.snackbar("hi", "snackbar");
                },
              ),
              title: const Text('Hacker News'),
              floating: true,
              backgroundColor: Colors.red[100],
              forceElevated: innerBoxIsScrolled,
              bottom: TabBar(tabs: [
                TabView(title: topStoryType.toUpperCase()),
                TabView(title: newStoryType.toUpperCase()),
                TabView(title: bestStoryType.toUpperCase()),
              ]),
            ),
          ],
          body: TabBarView(
            children: <Widget>[
              Obx(() => StoriesList(
                    key: Key(topStoryType),
                    stories: topStoriesController.topStories.value,
                    isLoading: topStoriesController.isLoading.value,
                  )),
              Obx(() => StoriesList(
                  key: Key(newStoryType),
                  stories: topStoriesController.topStories.value,
                  isLoading: topStoriesController.isLoading.value)),
              Obx(() => StoriesList(
                  key: Key(bestStoryType),
                  stories: topStoriesController.topStories.value,
                  isLoading: topStoriesController.isLoading.value)),
            ],
          ),
        ),
      ),
    ));
  }
}
