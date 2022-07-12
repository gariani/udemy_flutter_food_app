enum Complexity {
  simple,
  medium,
  difficult,
}

enum Cost {
  cheap,
  fair,
  expensive,
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> steps;
  final List<String> ingredients;
  final int duration;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;

  final Complexity complexity;
  final Cost cost;

  const Meal(
      {required this.id,
      required this.categories,
      required this.title,
      required this.imageUrl,
      required this.steps,
      required this.ingredients,
      required this.duration,
      this.isGlutenFree = false,
      this.isLactoseFree = false,
      this.isVegan = false,
      this.isVegetarian = false,
      required this.complexity,
      required this.cost});

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return 'Simple';
      case Complexity.medium:
        return 'Medium';
      case Complexity.difficult:
        return 'Complex';
      default:
        return 'Unknown';
    }
  }

  String get costText {
    switch (cost) {
      case Cost.cheap:
        return 'Cheap';
      case Cost.fair:
        return 'Fair';
      case Cost.expensive:
        return 'Expensive';
      default:
        return 'Unknown';
    }
  }
}
