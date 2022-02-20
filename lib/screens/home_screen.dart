import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hnnews/constants/constants.dart';
import 'package:hnnews/controllers/like_controller.dart';
import 'package:hnnews/models/arguments.dart';
import 'package:hnnews/views/icons.dart';
import 'package:hnnews/views/stories_list.dart';
import 'package:hnnews/controllers/stories_controller.dart';
import 'package:hnnews/views/tab_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<HomeScreen> {
  final likeController = Get.put(LikeController());
  final topStoriesController = Get.put(TopStoriesController());
  final newStoriesController = Get.put(NewStoriesController());
  final bestStoriesController = Get.put(BestStoriesController());
  final likeStoriesController = Get.put(LikeStoriesController());

  static const toolbarHeight = 50.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverAppBar(
                    toolbarHeight: toolbarHeight,
                    forceElevated: innerBoxIsScrolled,
                    automaticallyImplyLeading: true,
                    title: Text(
                      "Hacker News",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    // titleSpacing: 20,
                    floating: true,
                    snap: true,
                    pinned: true,
                    // backgroundColor: Colors.blueGrey,
                    // expandedHeight: 120,
                    bottom: TabBar(tabs: [
                      TabView(title: topStoryType.toUpperCase()),
                      TabView(title: newStoryType.toUpperCase()),
                      TabView(title: bestStoryType.toUpperCase()),
                    ]),

                    actions: <Widget>[
                      Obx(
                        () => IconButton(
                          icon: likeController.idss.isNotEmpty
                              ? likeIcon
                              : likedIcon,
                          onPressed: () {
                            Get.toNamed("likes",
                                arguments: RouteArgumentModel());
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ];
            },
            body: Container(
              margin: const EdgeInsets.only(top: toolbarHeight),
              child: TabBarView(children: <Widget>[
                SafeArea(
                  child: Obx(
                    () => StoriesList(
                      onRefresh: () => Future.sync(() {
                        topStoriesController.onRefresh();
                      }),
                      pageController: topStoriesController.pagingController,
                      isLoading: topStoriesController.isLoading.value,
                      type: topStoryType,
                    ),
                  ),
                ),
                SafeArea(
                  child: Obx(
                    () => StoriesList(
                      onRefresh: () => Future.sync(() {
                        newStoriesController.onRefresh();
                      }),
                      pageController: newStoriesController.pagingController,
                      isLoading: newStoriesController.isLoading.value,
                      type: newStoryType,
                    ),
                  ),
                ),
                SafeArea(
                  child: Obx(
                    () => StoriesList(
                      onRefresh: () => Future.sync(() {
                        bestStoriesController.onRefresh();
                      }),
                      pageController: bestStoriesController.pagingController,
                      isLoading: bestStoriesController.isLoading.value,
                      type: bestStoryType,
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
