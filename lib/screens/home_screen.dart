import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hnnews/constants/constants.dart';
import 'package:hnnews/views/stories_list.dart';
import 'package:hnnews/controllers/stories_controller.dart';
import 'package:hnnews/views/tab_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<HomeScreen> {
  final topStoriesController = Get.put(TopStoriesController());
  final newStoriesController = Get.put(NewStoriesController());
  final bestStoriesController = Get.put(BestStoriesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
      length: 3,
      child: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  title: const Text('Hacker News'),
                  floating: true,
                  pinned: true,
                  snap: false,
                  forceElevated: innerBoxIsScrolled,
                  bottom: TabBar(tabs: [
                    TabView(title: topStoryType.toUpperCase()),
                    TabView(title: newStoryType.toUpperCase()),
                    TabView(title: bestStoryType.toUpperCase()),
                  ]),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: <Widget>[
              Obx(() => StoriesList(
                    onRefresh: () => Future.sync(() {
                      topStoriesController.onRefresh();
                    }),
                    pageController: topStoriesController.pagingController,
                    isLoading: topStoriesController.isLoading.value,
                  )),
              Obx(() => StoriesList(
                  onRefresh: () => Future.sync(() {
                        print(99999888);
                        newStoriesController.pagingController.refresh();
                      }),
                  pageController: newStoriesController.pagingController,
                  isLoading: newStoriesController.isLoading.value)),
              Obx(() => StoriesList(
                  onRefresh: () => Future.sync(() {
                        print(99999888);
                        bestStoriesController.pagingController.refresh();
                      }),
                  pageController: bestStoriesController.pagingController,
                  isLoading: bestStoriesController.isLoading.value)),
            ],
          ),
        ),
      ),
    ));
  }
}
