import 'package:flutter/material.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/utils/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontSize: 15,
                fontFamily: 'RobotoCondensed',
              ),
              titleMedium: const TextStyle(
                fontSize: 14,
                fontFamily: 'RobotoCondensed',
              ),
              titleSmall: const TextStyle(
                fontSize: 12,
                fontFamily: 'RobotoCondensed',
              ),
            ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
        ).copyWith(secondary: Colors.amber),
      ),
      initialRoute: '/',
      routes: {
        AppRoutes.home: (ctx) => const MyHomePage(),
        AppRoutes.categoriesMeals: (ctx) => const CategoriesMaelsScreen(),
        AppRoutes.mealDetails: (ctx) => const MealDetailScreen(),
      },
      onGenerateRoute: (settings) {
        return null;
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) {
          return const CategoriesScreen();
        });
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Vamos Cozinhar?'),
        ),
        body: const Center(
          child: CategoriesScreen(),
        ),
      ),
    );
  }
}