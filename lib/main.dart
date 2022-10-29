import 'package:car_catalog/color_schemes.dart';
import 'package:car_catalog/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
        scaffoldBackgroundColor: darkColorScheme.background,
          useMaterial3: true,
          brightness: Brightness.dark,
          colorScheme: darkColorScheme),
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: lightColorScheme,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
