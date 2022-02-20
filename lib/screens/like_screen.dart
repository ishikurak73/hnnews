import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hnnews/controllers/like_controller.dart';

class LikeScreen extends StatefulWidget {
  @override
  LikePage createState() => LikePage();
}

class LikePage extends State<LikeScreen> {
  final likeController = Get.put(LikeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("test"),
    );
  }
}
