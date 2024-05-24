import 'package:finals_mobile_palman_lydzustre_5/constants/themes.dart';
import 'package:finals_mobile_palman_lydzustre_5/controllers/product_controller.dart';
import 'package:finals_mobile_palman_lydzustre_5/views/cart_page.dart';
import 'package:finals_mobile_palman_lydzustre_5/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPage extends ConsumerWidget {
  DetailPage({super.key, required this.getIndex});

  int getIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);
    final product = ref.watch(productNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kdefaultColor,
        // title: SvgPicture.asset( //// to be added soon
        //   'assets/general/store_brand.svg',
        //   color: kWhiteColor,
        //   width: 180,
        // ),
        title: Center(
          child: Text(
            'DETAILS PAGE',
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const CardPage(),
                  //   ),
                  // );
                },
                icon: Icon(Icons.local_mall_outlined)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.pink,
              // child: Image.asset(product[getIndex].imgUrl),
            ),
            Container(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product[getIndex].title,
                    style: AppTheme.kBigTitle.copyWith(color: kPrimaryColor),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      RatingBar(
                        itemSize: 25,
                        initialRating: 1,
                        minRating: 1,
                        maxRating: 5,
                        allowHalfRating: true,
                        ratingWidget: RatingWidget(
                          empty: Icon(
                            Icons.star_border,
                            color: Colors.amber,
                          ),
                          full: Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          half: Icon(
                            Icons.star_half_sharp,
                            color: Colors.amber,
                          ),
                        ),
                        onRatingUpdate: (value) => null,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text('125 review'),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(product[getIndex].longDescription),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${product[getIndex].price * product[getIndex].qty} ',
                        style: AppTheme.kHeadingOne,
                      ),
                      Container(
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                ref
                                    .read(productNotifierProvider.notifier)
                                    .decreaseQty(product[getIndex].pid);
                              },
                              icon: Icon(
                                Icons.do_not_disturb_on_outlined,
                                size: 30,
                              ),
                            ),
                            Text(
                              product[getIndex].qty.toString(),
                              style: AppTheme.kCardTitle,
                            ),
                            IconButton(
                              onPressed: () {
                                ref
                                    .read(productNotifierProvider.notifier)
                                    .incrementQty(product[getIndex].pid);
                              },
                              icon: Icon(
                                Icons.add_circle_outline,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      minimumSize: Size(
                        double.infinity,
                        50,
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Add Item in Bag',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kSecondaryColor,
        currentIndex: currentIndex,
        onTap: (value) =>
            ref.read(currentIndexProvider.notifier).update((state) => value),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'HOME',
            activeIcon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'FAVORITES',
            activeIcon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            label: 'LOCATION',
            activeIcon: Icon(Icons.location_on),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'PROFILE',
            activeIcon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
