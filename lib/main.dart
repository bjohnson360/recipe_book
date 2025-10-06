import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'details_screen.dart';
import 'favorites_screen.dart';

void main() => runApp(RecipeApp());

class Recipe {
  final String name;
  final String ingredients;
  final String instructions;
  bool isFavorite;

  Recipe({
    required this.name,
    required this.ingredients,
    required this.instructions,
    this.isFavorite = false,
  });
}

class RecipeApp extends StatefulWidget {
  @override
  _RecipeAppState createState() => _RecipeAppState();
}

class _RecipeAppState extends State<RecipeApp> {
  List<Recipe> recipes = [
    Recipe(
      name: "Spaghetti Bolognese",
      ingredients: "Pasta, Beef, Tomato Sauce, Garlic, Onion",
      instructions: "1. Cook pasta\n2. Make sauce\n3. Mix & serve",
    ),
    Recipe(
      name: "Pancakes",
      ingredients: "Flour, Eggs, Milk, Sugar, Butter",
      instructions: "1. Mix batter\n2. Cook on skillet\n3. Serve with syrup",
    ),
  ];

  void toggleFavorite(Recipe recipe) {
    setState(() => recipe.isFavorite = !recipe.isFavorite);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Book',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: HomeScreen(
        recipes: recipes,
        onToggleFavorite: toggleFavorite,
      ),
      routes: {
        '/favorites': (context) => FavoritesScreen(
              recipes: recipes.where((r) => r.isFavorite).toList(),
              onToggleFavorite: toggleFavorite,
            ),
      },
    );
  }
}
