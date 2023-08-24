import 'package:calcula_propina/app/ui/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.brown),
          colorSchemeSeed: Colors.brown),
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}
