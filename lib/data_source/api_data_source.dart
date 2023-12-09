
import 'package:flutter_responsi/data_source/base_network.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();

  Future <Map<String, dynamic>> getCategory() {
    return BaseNetwork.get('categories.php');
  }

  Future <Map<String, dynamic>> getMeals(String param) {
    return BaseNetwork.get('filter.php?c=$param');
  }

  Future <Map<String, dynamic>> getMeal(String id) {
    return BaseNetwork.get('lookup.php?i=$id');
  }
}