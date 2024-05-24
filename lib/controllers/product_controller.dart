import 'package:finals_mobile_palman_lydzustre_5/data/products.dart';
import 'package:finals_mobile_palman_lydzustre_5/model/product_model.dart';
import 'package:riverpod/riverpod.dart';

class ProductNotifier extends StateNotifier<List<ProductModel>> {
  ProductNotifier() : super(productItems);

  void isSelected(int pid, int index) {
    state = [
      for (final product in state)
        if (product.pid == pid)
          product.copyWith(isSelected: !state[index].isSelected)
        else
          product,
    ];
  }

  void incrementQty(int pid) {
    state = [
      for (final product in state)
        if (product.pid == pid)
          product.copyWith(qty: product.qty += 1)
        else
          product,
    ];
  }

  void decreaseQty(int pid) {
    state = [
      for (final product in state)
        if (product.pid == pid)
          product.copyWith(qty: product.qty -= 1)
        else
          product,
    ];
  }
}

final productNotifierProvider =
    StateNotifierProvider<ProductNotifier, List<ProductModel>>((ref) {
  return ProductNotifier();
});
