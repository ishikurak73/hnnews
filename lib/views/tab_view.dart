import 'package:flutter/material.dart';

class TabView extends StatelessWidget {
  TabView({Key? key, required this.title}) : super(key: key) {}

  String title;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Tab(
      child: Text(
        title,
        style: textTheme.subtitle2,
      ),
    );
  }
}
