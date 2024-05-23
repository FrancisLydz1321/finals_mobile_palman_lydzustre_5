import 'package:finals_mobile_palman_lydzustre_5/data/products.dart';
import 'package:finals_mobile_palman_lydzustre_5/model/product_model.dart';
import 'package:riverpod/riverpod.dart';

class ProductNotifier extends StateNotifier<List<ProductModel>> {
  ProductNotifier() : super(productItems);
}

final productNotifierProvider =
    StateNotifierProvider<ProductNotifier, List<ProductModel>>((ref) {
  return ProductNotifier();
});
