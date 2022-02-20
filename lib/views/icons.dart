import 'package:flutter/material.dart';

const double smallSize = 18;
const double largeSize = 24;

const likeIcon = Icon(
  Icons.favorite,
  size: largeSize,
  key: Key('like_icon'),
);

const likedIcon = Icon(
  Icons.favorite_outline_sharp,
  size: largeSize,
  key: Key('liked_icon'),
);

const smallLikeIcon = Icon(
  Icons.favorite,
  size: smallSize,
  key: Key('like_icon'),
);

const smallLikedIcon = Icon(
  Icons.favorite_outline_sharp,
  size: smallSize,
  key: Key('liked_icon'),
);

const smallCommentIcon = Icon(
  Icons.comment_outlined,
  size: smallSize,
  key: Key('comment_icon'),
);
