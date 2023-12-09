import 'package:flutter/material.dart';
import 'package:flutter_responsi/data_source/api_data_source.dart';
import 'package:flutter_responsi/models/detail_meals_models.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final String id;
  const DetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Detail'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ApiDataSource.instance.getMeal(id), 
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            DetailMealsModel data = DetailMealsModel.fromJson(snapshot.data);
            var meals = data.meals?[0];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Image.network(
                    meals!.strMealThumb!,
                    height: MediaQuery.sizeOf(context).height/3,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    meals.strMeal!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Category: ${meals.strCategory!}'),
                      Text('Area: ${meals.strArea!}'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Ingredients:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(meals.strIngredient1 ?? ''),
                  Text(meals.strIngredient2 ?? ''),
                  Text(meals.strIngredient3 ?? ''),
                  Text(meals.strIngredient4 ?? ''),
                  Text(meals.strIngredient5 ?? ''),
                  Text(meals.strIngredient6 ?? ''),
                  Text(meals.strIngredient7 ?? ''),
                  Text(meals.strIngredient8 ?? ''),
                  Text(meals.strIngredient9 ?? ''),
                  Text(meals.strIngredient10 ?? ''),
                  Text(meals.strIngredient11 ?? ''),
                  Text(meals.strIngredient12 ?? ''),
                  Text(meals.strIngredient13 ?? ''),
                  Text(meals.strIngredient14 ?? ''),
                  Text(meals.strIngredient15 ?? ''),
                  Text(meals.strIngredient16 ?? ''),
                  Text(meals.strIngredient17 ?? ''),
                  Text(meals.strIngredient18 ?? ''),
                  Text(meals.strIngredient19 ?? ''),
                  Text(meals.strIngredient20 ?? ''),

                  const SizedBox(height: 10),

                  const Text(
                    'Instructions',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(meals.strInstructions!),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      launchUrl(Uri.parse(meals.strYoutube!));
                    }, 
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(50)
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.play_arrow),
                        Text('Watch Tutorial'),
                      ],
                    )
                  )
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}