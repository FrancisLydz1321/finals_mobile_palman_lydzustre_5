import 'package:finals_mobile_palman_lydzustre_5/constants/themes.dart';
import 'package:finals_mobile_palman_lydzustre_5/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductCardWidget extends ConsumerWidget {
  const ProductCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final product = ref.watch(productNotifierProvider);
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
                  child: Image.asset('assets/products/airpods.jpg'),
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
                      'Product Name',
                      style: AppTheme.kCardTitle,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Short Description',
                      style: AppTheme.kBodyText,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$854'),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_circle,
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
