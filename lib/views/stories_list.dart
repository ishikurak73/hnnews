import 'package:flutter/material.dart';
import 'package:hnnews/models/story_model.dart';
import 'package:hnnews/views/story_tile.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class StoriesList extends StatelessWidget {
  StoriesList({
    Key? key,
    required this.isLoading,
    required this.onRefresh,
    required this.pageController,
  });

  bool isLoading;
  RefreshCallback onRefresh;
  PagingController<int, StoryModel> pageController;

  @override
  Widget build(BuildContext context) {
    // isLoading
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: PagedListView<int, StoryModel>.separated(
        pagingController: pageController,
        builderDelegate: PagedChildBuilderDelegate<StoryModel>(
          animateTransitions: true,
          itemBuilder: (context, item, index) => StoryTile(story: item),
        ),
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }
}
