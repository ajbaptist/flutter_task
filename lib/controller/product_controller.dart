import 'package:get/get.dart';
import '../model/product_model.dart';
import '../service/product_repository.dart';

class ProductController extends GetxController {
  RxList<Product> productData = <Product>[].obs;
  var categories = <String>[].obs;
  RxBool loading = false.obs;
  var selectedCat = "".obs;

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
      productData.value = response.products ?? [];
      loading.value = false;
    }
  }

  Future onChange({required String value}) async {
    selectedCat.value = value;
    categoryWiseProduct();
  }

  Future fetchCategories() async {
    categories.clear();
    final response = await ProductRepository.getCategories();

    if (response != null) {
      categories.value = response;
    }
  }

  Future searchProduct(String search) async {
    final response = await ProductRepository.searchProduct(search: search);

    if (response != null) {
      if (selectedCat.value != "") {
        productData.value = response.products!
            .where((element) => element.category == selectedCat.value)
            .toList();
      } else {
        productData.value = response.products ?? [];
      }
    }
  }

  Future categoryWiseProduct() async {
    final response =
        await ProductRepository.categoryFilter(category: selectedCat.value);

    if (response != null) {
      productData.value = response.products ?? [];
    }
  }
}
