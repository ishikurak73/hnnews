import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hnnews/constants/design_constants.dart';
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
      title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(
            top: space12,
            bottom: space8,
          ),
          child: Text(
            story.title,
            // style: Theme.of(context).textTheme.bodyText1,
            style: header6Style(
                color: Theme.of(context).textTheme.headline6?.color),
          ),
        ),
      ]),
      subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: space0),
          child: Text(
            toHost(story.url ?? ''),
            style: captionTextStyle(
                color: Theme.of(context).textTheme.caption?.color),
            maxLines: 1,
            overflow: TextOverflow.fade,
            softWrap: false,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: space8, bottom: space4),
          child: Text(
            '${fromNow(story.time)} \u{2022} ${story.score} points by ${story.by}',
            style: captionTextStyle(
                color: Theme.of(context).textTheme.caption?.color),
            maxLines: 1,
            overflow: TextOverflow.fade,
            softWrap: false,
          ),
        ),
        Row(
          children: [
            Obx(
              () => IconButton(
                icon: likeController.has(story.id) == true
                    ? smallLikeIcon
                    : smallLikedIcon,
                key: Key('${story.id}'),
                onPressed: () {
                  likeController.toggle(story.id);
                },
              ),
            ),
            TextButton.icon(
              icon: smallCommentIcon,
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(
                    Theme.of(context).iconTheme.color),
              ),
              label: Text(
                story.descendants.toString(),
                style: TextStyle(color: IconTheme.of(context).color),
              ),
              key: Key('${story.id}'),
              onPressed: () {
                Get.toNamed("comments",
                    arguments: RouteArgumentModel(
                        storyId: story.id, title: story.title));
              },
            ),
          ],
        ),
      ]),
      onTap: () => {
        Get.toNamed("webviewer",
            arguments: RouteArgumentModel(url: story.url, title: story.title))
      },
    );
  }
}
