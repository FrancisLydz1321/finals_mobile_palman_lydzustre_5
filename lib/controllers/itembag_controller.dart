import 'package:finals_mobile_palman_lydzustre_5/model/product_model.dart';
import 'package:riverpod/riverpod.dart';

List<ProductModel> itemBag = [
  ProductModel(
      pid: 9,
      imgUrl: 'assets/products/magic.jpg',
      title: 'yoga',
      price: 999,
      shortDescription: 'asdasdasdasdasdas',
      longDescription: 'asdasdasdasdasd',
      reviews: 69,
      rating: 3.5),
  ProductModel(
    pid: 10,
    imgUrl: 'assets/products/magic.jpg',
    title: 'zfold',
    price: 1099,
    shortDescription: 'asdasdasdasdasdas',
    longDescription: 'asdasdasdasdasd',
    reviews: 69,
    rating: 3.5,
  ),
];

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
