import 'package:flutter/material.dart';
//import 'package:get/get.dart';
import 'package:hnnews/controllers/like_controller.dart';
import 'package:hnnews/controllers/stories_controller.dart';
import 'package:hnnews/views/stories_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LikeScreen extends ConsumerStatefulWidget {
  @override
  LikePage createState() => LikePage();
}

class LikePage extends ConsumerState<LikeScreen> {
  static const toolbarHeight = 50.00;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final likeStoriesController = ref.watch(likeStoriesProvider);
    final likeController = ref.watch(likeProvider);

    likeStoriesController.storiesIds = likeController.idss;
    likeStoriesController.onRefresh();
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  toolbarHeight: toolbarHeight,
                  forceElevated: innerBoxIsScrolled,
                  automaticallyImplyLeading: true,
                  title: Text(
                    "Likes",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  // titleSpacing: 20,
                  floating: true,
                  snap: true,
                  pinned: true,
                  // backgroundColor: Colors.blueGrey,
                  // expandedHeight: 120,
                  leading: IconButton(
                    icon: const Icon(Icons.chevron_left_sharp),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),

                  actions: <Widget>[],
                ),
              ),
            ];
          },
          body: Container(
            margin: const EdgeInsets.only(top: toolbarHeight),
            child:
            StoriesList(
              onRefresh: () => Future.sync(() {
                likeStoriesController.onRefresh();
              }),
              pageController: likeStoriesController.pagingController,
              isLoading: likeStoriesController.isLoading.value,
              type: "like",
            ),
          ),
        ),
      ),
    );
  }
}
