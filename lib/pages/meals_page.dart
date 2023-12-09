import 'package:flutter/material.dart';
import 'package:flutter_responsi/data_source/api_data_source.dart';
import 'package:flutter_responsi/models/meals_models.dart';
import 'package:flutter_responsi/pages/detail_page.dart';

class MealsPage extends StatelessWidget {
  final String param;
  const MealsPage({super.key, required this.param});

  @override
  Widget build( context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$param Meals'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ApiDataSource.instance.getMeals(param), 
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            MealsModel data = MealsModel.fromJson(snapshot.data);
            return GridView.builder(
              itemCount: data.meals?.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2
              ), 
              itemBuilder: (context, index) {
                var meals = data.meals![index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context, MaterialPageRoute(
                        builder: (context) => DetailPage(id: meals.idMeal!), 
                      )
                    );
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Image.network(
                          meals.strMealThumb!,
                          fit: BoxFit.fitHeight,
                          width: MediaQuery.sizeOf(context).width/3,
                        ), 
                        const SizedBox(height: 10),
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(meals.strMeal!)
                        )
                      ],
                    ),
                  ),
                );
              },
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