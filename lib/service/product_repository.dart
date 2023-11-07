import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../model/product_model.dart';

class ProductRepository {
  static Future<ProductModel?> getProducts() async {
    try {
      final response =
          await http.get(Uri.parse('https://dummyjson.com/products'));
      if (response.statusCode == 200) {
        return productModelFromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return null;
    }
  }
}
