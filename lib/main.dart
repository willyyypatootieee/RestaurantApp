import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/restaurant_provider.dart';
import 'theme/restaurant_list_page.dart';


void main() {
  runApp(const RestaurantApp());
}

class RestaurantApp extends StatelessWidget {
  const RestaurantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RestaurantProvider(),
      child: Builder(
        builder: (context) {
          final theme = ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.orange,
            fontFamily: 'Roboto',
          );
          final darkTheme = ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'Roboto',
            primarySwatch: Colors.deepOrange,
          );

          return MaterialApp(
            title: 'Restaurant App',
            theme: theme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.system,
            home: const RestaurantListPage(),
          );
        },
      ),
    );
  }
}