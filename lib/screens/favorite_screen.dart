import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import 'package:meals/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({
    Key? key,
    required this.favoritesMeals,
  }) : super(key: key);

  final List<Meal> favoritesMeals;

  @override
  Widget build(BuildContext context) {
    if (favoritesMeals.isEmpty) {
      return const Center(
        child: Text('Minhas refeicoes favoritas'),
      );
    }

    return ListView.builder(
      itemCount: favoritesMeals.length,
      itemBuilder: (context, index) {
        return MealItem(meal: favoritesMeals[index]);
      },
    );
  }
}
