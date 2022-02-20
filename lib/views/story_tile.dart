import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hnnews/models/arguments.dart';
import 'package:hnnews/controllers/like_controller.dart';
import 'package:hnnews/models/story_model.dart';
import 'package:hnnews/utilities/datetime.dart';
import 'package:hnnews/utilities/strings.dart';
import 'package:hnnews/views/icons.dart';

class StoryTile extends StatelessWidget {
  StoryTile({Key? key, required this.story}) : super(key: key);

  StoryModel story;
  final likeController = Get.find<LikeController>();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Obx(() => IconButton(
            icon: likeController.has(story.id) == true ? likeIcon : likedIcon,
            key: Key('${story.id}'),
            onPressed: () {
              likeController.toggle(story.id);
              // Get.toNamed("like",
              //     arguments:
              //         RouteArgumentModel(storyId: story.id, title: story.title))
            },
          )),
      title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          toHost(story.url ?? ''),
          style: Theme.of(context).textTheme.caption,
          maxLines: 1,
          overflow: TextOverflow.fade,
          softWrap: false,
        ),
        Text(
          story.title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ]),
      subtitle: Text(
        '${fromNow(story.time)} \u{2022} ${story.score} points by ${story.by}',
        style: Theme.of(context).textTheme.caption,
        maxLines: 1,
        overflow: TextOverflow.fade,
        softWrap: false,
      ),
      onTap: () => {
        Get.toNamed("webviewer",
            arguments: RouteArgumentModel(url: story.url, title: story.title))
      },
      trailing: IconButton(
        icon: const Icon(Icons.add),
        onPressed: () {
          print(likeController.idss);
          Get.toNamed("comments",
              arguments:
                  RouteArgumentModel(storyId: story.id, title: story.title));
        },
      ),
    );
  }
}
