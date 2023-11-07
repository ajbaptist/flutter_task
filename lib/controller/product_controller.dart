import 'package:get/get.dart';

import '../model/product_model.dart';
import '../service/product_repository.dart';

class ProductController extends GetxController {
  Rxn<ProductModel> productData = Rxn<ProductModel>();
  RxBool loading = false.obs;

  @override
  void onInit() {
    fetchProduct();
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
}
