import 'package:flutter/material.dart';
import 'package:hnnews/constants/constants.dart';
import 'package:hnnews/constants/design_constants.dart';
import 'package:hnnews/controllers/like_controller.dart';
import 'package:hnnews/models/arguments.dart';
import 'package:hnnews/views/icons.dart';
import 'package:hnnews/views/stories_list.dart';
import 'package:hnnews/controllers/stories_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  @override
  HomePage createState() => HomePage();
}

class HomePage extends ConsumerState<HomeScreen> {
  static const toolbarHeight = 50.00;
  bool isDark = true;

  @override
  Widget build(BuildContext context) {

    final likeController = ref.watch(likeProvider);
    final topStoriesController = ref.watch(topStoriesProvider);
    final newStoriesController = ref.watch(newStoriesProvider);
    final bestStoriesController = ref.watch(bestStoriesProvider);

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
                    centerTitle: true,

                    title: Text(
                      "Hacker News",
                      style: appHeader3Style(
                        color: Theme.of(context).textTheme.headline1?.color,
                      ),
                    ),
                    // titleSpacing: 20,
                    floating: true,
                    snap: true,
                    pinned: true,
                    // backgroundColor: Colors.blueGrey,
                    // expandedHeight: 120,
                    bottom: TabBar(tabs: [
                      Tab(
                        child: Text(
                          topStoryType.toUpperCase(),
                          style: header9Style(
                            color: Theme.of(context).textTheme.subtitle2?.color,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          newStoryType.toUpperCase(),
                          style: header9Style(
                            color: Theme.of(context).textTheme.subtitle2?.color,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          bestStoryType.toUpperCase(),
                          style: header9Style(
                            color: Theme.of(context).textTheme.subtitle2?.color,
                          ),
                        ),
                      ),
                    ]),
                    actions: <Widget>[
                      IconButton(
                        icon: likeController.idss.isNotEmpty
                            ? likeIcon
                            : likedIcon,
                        onPressed: () {
                          Navigator.pushNamed(context, 'likes',
                              arguments: RouteArgumentModel());
                        },
                      ),
                      Switch(
                        activeColor: Theme.of(context).focusColor,
                        value: isDark,
                        onChanged: (bool value) {
                          setState(() {
                            isDark = value;
                          });
                        },
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
                  child:
                  StoriesList(
                    onRefresh: () => Future.sync(() {
                      topStoriesController.onRefresh();
                    }),
                    pageController: topStoriesController.pagingController,
                    isLoading: topStoriesController.isLoading.value,
                    type: topStoryType,
                  ),
                ),
                SafeArea(
                  child:
                  StoriesList(
                    onRefresh: () => Future.sync(() {
                      newStoriesController.onRefresh();
                    }),
                    pageController: newStoriesController.pagingController,
                    isLoading: newStoriesController.isLoading.value,
                    type: newStoryType,
                  ),
                ),
                SafeArea(
                  child:
                  StoriesList(
                    onRefresh: () => Future.sync(() {
                      bestStoriesController.onRefresh();
                    }),
                    pageController: bestStoriesController.pagingController,
                    isLoading: bestStoriesController.isLoading.value,
                    type: bestStoryType,
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
