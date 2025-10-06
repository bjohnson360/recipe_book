import 'package:flutter/material.dart';
import 'main.dart';

class DetailsScreen extends StatelessWidget {
  final Recipe recipe;
  final Function(Recipe) onToggleFavorite;

  const DetailsScreen({
    required this.recipe,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Ingredients", style: Theme.of(context).textTheme.titleLarge),
            Text(recipe.ingredients),
            const SizedBox(height: 16),
            Text("Instructions", style: Theme.of(context).textTheme.titleLarge),
            Text(recipe.instructions),
            const Spacer(),
            Center(
              child: ElevatedButton.icon(
                icon: Icon(
                  recipe.isFavorite ? Icons.favorite : Icons.favorite_border,
                ),
                label: Text(recipe.isFavorite ? "Unfavorite" : "Favorite"),
                onPressed: () {
                  onToggleFavorite(recipe);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
