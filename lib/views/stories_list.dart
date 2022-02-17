import 'package:flutter/material.dart';
import 'package:hnnews/models/story_model.dart';
import 'package:hnnews/views/story_tile.dart';

class StoriesList extends StatelessWidget {
  StoriesList({
    Key? key,
    required this.stories,
    required this.isLoading,
    required this.storyType,
  }) {}

  List<StoryModel> stories;
  bool isLoading;
  String storyType;

  @override
  Widget build(BuildContext context) {
    // isLoading
    return ListView.builder(
      key: PageStorageKey<String>(storyType),
      itemCount: stories.length,
      itemBuilder: (context, index) {
        return StoryTile(story: stories[index]);
      },
    );
  }
}
