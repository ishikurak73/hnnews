import 'package:flutter/material.dart';

class CommentScreen extends StatelessWidget {
  final int storyId;
  final String title;

  const CommentScreen({Key? key, required this.storyId, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comment Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
