import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({
    Key? key,
    required this.onToggleFavorite,
    required this.isFavorite,
  }) : super(key: key);

  final Function(Meal) onToggleFavorite;

  final bool Function(Meal) isFavorite;

  Widget _creatSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget _createSectionContainer({Widget? child}) {
    return Container(
        width: 300,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: child);
  }

  Widget _getListIngredientes(BuildContext context, Meal meal) {
    return ListView.builder(
      itemCount: meal.ingredients.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          child: Card(
            color: Theme.of(context).colorScheme.secondary,
            child: Text(meal.ingredients[index]),
          ),
        );
      },
    );
  }

  Widget _getListPassos(BuildContext context, Meal meal) {
    return ListView.builder(
      itemCount: meal.steps.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            child: Text('$index'),
          ),
          title: Text(meal.steps[index]),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _creatSectionTitle(context, 'Ingredientes'),
            _createSectionContainer(
              child: _getListIngredientes(context, meal),
            ),
            _creatSectionTitle(context, 'Passos'),
            _createSectionContainer(
              child: _getListPassos(context, meal),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          onToggleFavorite(meal);
        },
        child: Icon(
          isFavorite(meal) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }
}
