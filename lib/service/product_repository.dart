import 'dart:convert';
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

  static Future<List<String>?> getCategories() async {
    try {
      final response = await http
          .get(Uri.parse('https://dummyjson.com/products/categories'));
      if (response.statusCode == 200) {
        var out = List<String>.from(json.decode(response.body).map((x) => x));
        return out;
      } else {
        return null;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return null;
    }
  }

  static Future<ProductModel?> searchProduct({required String search}) async {
    try {
      final response = await http
          .get(Uri.parse('https://dummyjson.com/products/search?q=$search'));
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

  static Future<ProductModel?> categoryFilter(
      {required String category}) async {
    try {
      final response = await http
          .get(Uri.parse('https://dummyjson.com/products/category/$category'));
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
