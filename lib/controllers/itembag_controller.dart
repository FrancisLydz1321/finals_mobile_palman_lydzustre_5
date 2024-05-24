import 'package:finals_mobile_palman_lydzustre_5/model/product_model.dart';
import 'package:riverpod/riverpod.dart';

List<ProductModel> itemBag = [];

class ItemBagNotifier extends StateNotifier<List<ProductModel>> {
  ItemBagNotifier() : super(itemBag);

  void addNewItemBag(ProductModel productModel) {
    state = [...state, productModel];
  }

  void removeItem(int pid) {
    state = [
      for (final product in state)
        if (product.pid != pid) product,
    ];
  }
}

final itemBagProvider =
    StateNotifierProvider<ItemBagNotifier, List<ProductModel>>((ref) {
  return ItemBagNotifier();
});
