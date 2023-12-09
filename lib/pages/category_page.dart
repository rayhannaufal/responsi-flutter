import 'package:flutter/material.dart';
import 'package:flutter_responsi/data_source/api_data_source.dart';
import 'package:flutter_responsi/models/category_models.dart';
import 'package:flutter_responsi/pages/meals_page.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category Meals'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ApiDataSource.instance.getCategory(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            CategoryModel data = CategoryModel.fromJson(snapshot.data);
            return ListView.builder(
              itemCount: data.categories!.length,
              itemBuilder: (context, index) {
                var category =  data.categories![index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context, MaterialPageRoute(
                        builder: (context) => MealsPage(param: category.strCategory!), 
                      )
                    );
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image.network(category.strCategoryThumb!),
                          Text(
                            category.strCategory!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24
                            ),
                          ),
                          Text(category.strCategoryDescription!)
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}