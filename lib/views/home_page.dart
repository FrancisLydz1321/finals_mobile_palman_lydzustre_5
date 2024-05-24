import 'package:finals_mobile_palman_lydzustre_5/constants/themes.dart';
import 'package:finals_mobile_palman_lydzustre_5/controllers/itembag_controller.dart';
import 'package:finals_mobile_palman_lydzustre_5/controllers/product_controller.dart';
import 'package:finals_mobile_palman_lydzustre_5/views/cart_page.dart';
import 'package:finals_mobile_palman_lydzustre_5/views/detail_page.dart';
import 'package:finals_mobile_palman_lydzustre_5/widgets/ads_banner_widget.dart';
import 'package:finals_mobile_palman_lydzustre_5/widgets/card_widget.dart';
import 'package:finals_mobile_palman_lydzustre_5/widgets/chip_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';

final currentIndexProvider = StateProvider((ref) {
  return 0;
});

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productNotifierProvider);
    final currentIndex = ref.watch(currentIndexProvider);
    final itemBag = ref.watch(itemBagProvider);

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
            'E-COMMERCE',
            style: AppTheme.kBigTitle,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0, top: 10),
            child: Badge(
              label: Text(itemBag.length.toString()),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CardPage(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.local_mall_outlined,
                    size: 24,
                  )),
            ),
          )
        ],
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const AdsBannerWidget(),
              // ChipWidget(),

              SizedBox(
                // *Checkpoint
                // Container
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    ChipWidget(
                      chipLabel: 'All',
                    ),
                    ChipWidget(
                      chipLabel: 'Computers',
                    ),
                    ChipWidget(
                      chipLabel: 'Printing',
                    ),
                    ChipWidget(
                      chipLabel: 'Accessories',
                    ),
                    ChipWidget(
                      chipLabel: 'Databases',
                    ),
                    ChipWidget(
                      chipLabel: 'Servers',
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'HOT SALES',
                    style: AppTheme.kHeadingOne,
                  ),
                  Text(
                    'See All',
                    style: AppTheme.kSeeAllText,
                  ),
                ],
              ),

              const SizedBox(
                height: 12,
              ),

              Container(
                padding: EdgeInsets.all(4),
                width: double.infinity,
                height: 300,
                child: ListView.builder(
                  padding: EdgeInsets.all(4),
                  itemCount: products.length,
                  // scrollDirection: Axis.horizontal,
                  // shrinkWrap: true,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(getIndex: index),
                      ),
                    ),
                    child: ProductCardWidget(
                      productIndex: index,
                    ),
                  ),
                ),
                // child: const ProductCardWidget(),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'FEATURED SALES',
                    style: AppTheme.kHeadingOne,
                  ),
                  Text(
                    'See All',
                    style: AppTheme.kSeeAllText,
                  ),
                ],
              ),

              // MasonryGridView.builder(
              //   gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 1,
              //   ),
              //   itemBuilder: (context, index) => const SizedBox(
              //     height: 250,
              //     child: ProductCardWidget(),
              //   ),
              // ),

              const SizedBox(
                height: 12,
              ),

              Container(
                padding: EdgeInsets.all(4),
                width: double.infinity,
                height: 280,
                child: ListView.builder(
                  padding: EdgeInsets.all(4),
                  itemCount: products.length,
                  // scrollDirection: Axis.horizontal,
                  // shrinkWrap: true,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          getIndex: index,
                        ),
                      ),
                    ),
                    child: SizedBox(
                        height: 250,
                        child: ProductCardWidget(productIndex: index)),
                  ),
                ),
                // child: const ProductCardWidget(),
              ),
            ],
          ),
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
