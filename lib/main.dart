import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hnnews/models/arguments.dart';
import 'package:hnnews/screens/comment_screen.dart';
import 'package:hnnews/screens/like_screen.dart';
import 'package:hnnews/screens/webview_screen.dart';
import 'package:hnnews/screens/home_screen.dart';
import 'package:hnnews/theme/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  ProviderScope(
        child:MaterialApp(
          title: 'Hacker News',
          theme: CustomTheme.dark,
          darkTheme: CustomTheme.light,
          initialRoute: '/',
          routes: {
            '/': (context) => HomeScreen(),
          },
          onGenerateRoute: (settings) {
            RouteArgumentModel arguments = settings.arguments as RouteArgumentModel;
            if (settings.name == "webviewer") {
              return MaterialPageRoute(
                  builder: (BuildContext context) => WebViewer(
                    url: arguments.url as String,
                    title: arguments.title as String,
                  ));
            } else if (settings.name == "comments") {
              return MaterialPageRoute(
                  builder: (BuildContext context) => CommentScreen(
                    title: arguments.title as String,
                    storyId: arguments.storyId as int,
                  ));
            } else if (settings.name == "likes") {
              return MaterialPageRoute(
                  builder: (BuildContext context) => LikeScreen());
            }
          },
        )
    );
  }
}
