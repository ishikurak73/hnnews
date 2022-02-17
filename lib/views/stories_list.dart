import 'package:flutter/material.dart';
import 'package:hnnews/models/story_model.dart';
import 'package:hnnews/views/story_tile.dart';

class StoriesList extends StatelessWidget {
  StoriesList({Key? key, required this.stories, required this.isLoading}) {}

  List<StoryModel> stories;
  bool isLoading;

  @override
  Widget build(BuildContext context) {
    // isLoading
    return ListView.builder(
      key: PageStorageKey<String>(key.toString()),
      itemCount: stories.length,
      itemBuilder: (context, index) {
        return StoryTile(story: stories[index]);
      },
    );
  }
}
