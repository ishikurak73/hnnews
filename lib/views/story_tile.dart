import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hnnews/models/arguments.dart';
import 'package:hnnews/models/story_model.dart';

class StoryTile extends StatelessWidget {
  StoryTile({Key? key, required this.story}) : super(key: key);

  StoryModel story;
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        story.title,
      ),
      onTap: () => {
        Get.toNamed("webviewer",
            arguments: RouteArgumentModel(url: story.url, title: story.title))
      },
      leading: IconButton(
        icon: const Icon(Icons.favorite),
        onPressed: () {
          var likedStories = box.read('liked_stories') ?? [];
          likedStories.add(story.id);
          box.write('liked_stories', likedStories);

          // Get.toNamed("like",
          //     arguments:
          //         RouteArgumentModel(storyId: story.id, title: story.title))
        },
      ),
      trailing: IconButton(
        icon: const Icon(Icons.add),
        onPressed: () {
          print(box.read('liked_stories'));
          Get.toNamed("comments",
              arguments:
                  RouteArgumentModel(storyId: story.id, title: story.title));
        },
      ),
    );
  }
}
