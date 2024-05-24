import 'package:finals_mobile_palman_lydzustre_5/constants/themes.dart';
import 'package:finals_mobile_palman_lydzustre_5/controllers/itembag_controller.dart';
import 'package:finals_mobile_palman_lydzustre_5/controllers/product_controller.dart';
import 'package:finals_mobile_palman_lydzustre_5/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductCardWidget extends ConsumerWidget {
  const ProductCardWidget({
    super.key,
    required this.productIndex,
  });

  final int productIndex;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(productNotifierProvider);
    return Container(
      padding: EdgeInsets.all(4),
      // color: Colors.amber,
      height: 290,
      width: double.infinity,
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 2,
        scrollDirection: Axis.horizontal,
        // shrinkWrap: true,
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 6),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
          ),
          margin: const EdgeInsets.all(12),
          // color: kWhiteColor,
          width: MediaQuery.of(context).size.width * .5,

          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(12),
                  color: kLightBackground,
                  child: Image.asset(product[productIndex].imgUrl),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product[productIndex].title,
                      style: AppTheme.kCardTitle,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      product[productIndex].shortDescription,
                      style: AppTheme.kBodyText,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${product[productIndex].price}',
                          style: AppTheme.kCardTitle,
                        ),
                        IconButton(
                          onPressed: () {
                            ref
                                .read(productNotifierProvider.notifier)
                                .isSelected(
                                    product[productIndex].pid, productIndex);

                            if (product[productIndex].isSelected == false) {
                              ref.watch(itemBagProvider.notifier).addNewItemBag(
                                    ProductModel(
                                        pid: product[productIndex].pid,
                                        imgUrl: product[productIndex].imgUrl,
                                        title: product[productIndex].title,
                                        price: product[productIndex].price,
                                        shortDescription: product[productIndex]
                                            .shortDescription,
                                        longDescription: product[productIndex]
                                            .longDescription,
                                        reviews: product[productIndex].reviews,
                                        rating: product[productIndex].rating),
                                  );
                            } else {
                              ref
                                  .read(
                                    itemBagProvider.notifier,
                                  )
                                  .removeItem(
                                    product[productIndex].pid,
                                  );
                            }
                            // print(product[productIndex].isSelected);
                          },
                          icon: Icon(
                            // Icons.add_circle,
                            product[productIndex].isSelected
                                ? Icons.check_circle
                                : Icons.add_circle,
                            size: 30,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
