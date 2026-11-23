import 'package:flutter/material.dart';
import 'package:group_app/data/notifiers.dart';
import 'package:group_app/views/widget_tree.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDarkMode, child) {
        return MaterialApp(
          title: 'GroupApp',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: isDarkMode ? Colors.purple : Colors.purpleAccent,
              brightness: isDarkMode ? Brightness.dark : Brightness.light,
            ),
          ),
          home: WidgetTree(),
        );
      },
    );
  }
}
