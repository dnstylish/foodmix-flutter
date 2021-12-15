import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodmix/models/recipe.dart';
import 'package:foodmix/views/recipe_view.dart';

class RecipeItem extends StatelessWidget {
  const RecipeItem({Key? key, required this.recipe}) : super(key: key);
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeView(slug: recipe.slug))),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: recipe.cdn(recipe.avatar),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              child: Container(
                color: Colors.black.withOpacity(0.2),
              ),
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
            ),
            Positioned(
                top: 25,
                left: 20,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${recipe.user?.name}',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.star_border, color: Colors.white, size: 25),
                        const SizedBox(width: 4),
                        Text('${recipe.rating}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16))
                      ],
                    )
                  ],
                )),
            Positioned(
                bottom: 15,
                left: 20,
                right: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(recipe.name, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.schedule, color: Colors.white, size: 25),
                        const SizedBox(width: 4),
                        Text('${recipe.time}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16))
                      ],
                    )
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
