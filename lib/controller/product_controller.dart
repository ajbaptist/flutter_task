import 'package:get/get.dart';

import '../model/product_model.dart';
import '../service/product_repository.dart';

class ProductController extends GetxController {
  Rxn<ProductModel> productData = Rxn<ProductModel>();
  var categories = <String>[].obs;
  RxBool loading = false.obs;
  var selectedCat = ''.obs;

  @override
  void onInit() {
    fetchProduct();
    fetchCategories();
    super.onInit();
  }

  Future fetchProduct() async {
    loading.value = true;
    final response = await ProductRepository.getProducts();

    if (response != null) {
      print(response);
      productData.value = response;
      loading.value = false;
    }
  }

  Future onChange({required String value}) async {
    selectedCat.value = value;
  }

  Future fetchCategories() async {
    categories.clear();
    final response = await ProductRepository.getCategories();

    if (response != null) {
      categories.value = response;
    }
    selectedCat.value = categories.first;
  }

  Future searchProduct(String search) async {
    final response = await ProductRepository.searchProduct(search: search);

    if (response != null) {
      productData.value = response;
    }
  }
}
