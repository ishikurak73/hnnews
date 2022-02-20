import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hnnews/controllers/like_controller.dart';
import 'package:hnnews/controllers/stories_controller.dart';
import 'package:hnnews/views/stories_list.dart';

class LikeScreen extends StatefulWidget {
  @override
  LikePage createState() => LikePage();
}

class LikePage extends State<LikeScreen> {
  final likeStoriesController = Get.put(LikeStoriesController());
  final likeController = Get.put(LikeController());

  // final likeController = Get.find<LikeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => StoriesList(
            onRefresh: () => Future.sync(() {
              likeStoriesController.onRefresh();
            }),
            pageController: likeStoriesController.pagingController,
            isLoading: likeStoriesController.isLoading.value,
            type: "like",
          ),
        ),
      ),
    );
  }
}
