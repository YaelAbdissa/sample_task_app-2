import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'database/task_provider.dart';
import 'screens/main_menu/main_menu_screen.dart';

import 'constants/constants.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: whiteColor,
      ),
      debugShowCheckedModeBanner: false,
      home: const MainMenuScreen(),
    );
  }
}
