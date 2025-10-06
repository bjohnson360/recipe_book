import 'package:flutter/material.dart';
import 'details_screen.dart';
import 'main.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Recipe> recipes;
  final Function(Recipe) onToggleFavorite;

  const FavoritesScreen({
    required this.recipes,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite Recipes')),
      body: recipes.isEmpty
          ? const Center(child: Text('No favorite recipes yet.'))
          : ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return ListTile(
                  title: Text(recipe.name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          recipe: recipe,
                          onToggleFavorite: onToggleFavorite,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
