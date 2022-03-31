import 'dart:convert';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/file_handler.dart';
import 'package:todoapp/task_list.dart';
import 'package:todoapp/list_page.dart';

// Need task list provider on root of the app
void main() {

  // Run app
  runApp(
    // Provide task list
    ChangeNotifierProvider(
      create: (context) => TaskList(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List App',
      theme: NeumorphicThemeData(
        baseColor: Color(0xFFDDDDDD),
        lightSource: LightSource.topLeft,
        depth: 6,
        intensity: 0.8,
        appBarTheme: NeumorphicAppBarThemeData(
          centerTitle: true,
          textStyle: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      home: ListPage(),
    );
  }
}