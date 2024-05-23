import 'package:finals_mobile_palman_lydzustre_5/constants/themes.dart';
import 'package:finals_mobile_palman_lydzustre_5/widgets/ads_banner_widget.dart';
import 'package:finals_mobile_palman_lydzustre_5/widgets/card_widget.dart';
import 'package:finals_mobile_palman_lydzustre_5/widgets/chip_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
            'THIS IS A TITLE',
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
                onPressed: () {}, icon: Icon(Icons.local_mall_outlined)),
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
                      chipLabel: 'asdasdasdasd',
                    ),
                    ChipWidget(
                      chipLabel: 'qweqweqwe',
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
                  itemCount: 3,
                  // scrollDirection: Axis.horizontal,
                  // shrinkWrap: true,
                  itemBuilder: (context, index) => const ProductCardWidget(),
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
                height: 300,
                child: ListView.builder(
                  padding: EdgeInsets.all(4),
                  // itemCount: 3,
                  // scrollDirection: Axis.horizontal,
                  // shrinkWrap: true,
                  itemBuilder: (context, index) => const SizedBox(
                      height: 250, child: const ProductCardWidget()),
                ),
                // child: const ProductCardWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
