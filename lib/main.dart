import 'package:flutter/material.dart';
import 'package:instagram_ui/navbar.dart';
import 'package:instagram_ui/provider/data_provider.dart';
import 'package:instagram_ui/provider/home_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DataProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        visualDensity: const VisualDensity(horizontal: 2, vertical: 2),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          actionsIconTheme: IconThemeData(
            color: Colors.white,
            size: 25,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const NavBar(),
    );
  }
}
