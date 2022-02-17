import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hnnews/models/arguments.dart';
import 'package:hnnews/models/story_model.dart';

class StoryTile extends StatelessWidget {
  StoryTile({Key? key, required this.story}) {}

  StoryModel story;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(story.title),
      onTap: () => {
        Get.toNamed("webviewer",
            arguments: RouteArgumentModel(url: story.url, title: story.title))
      },
      trailing: IconButton(
        icon: Icon(Icons.add),
        onPressed: () => {
          Get.toNamed("comments",
              arguments:
                  RouteArgumentModel(storyId: story.id, title: story.title))
        },
      ),
    );
  }
}
