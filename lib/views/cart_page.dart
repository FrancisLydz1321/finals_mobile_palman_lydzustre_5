import 'package:finals_mobile_palman_lydzustre_5/constants/themes.dart';
import 'package:finals_mobile_palman_lydzustre_5/controllers/itembag_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardPage extends ConsumerWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemBag = ref.watch(itemBagProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kdefaultColor,
        title: Center(
          child: Text(
            'MY CART',
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
      // body: SingleChildScrollView(
      //   child:
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              // height: 300,
              // width: double.infinity,
              // color: Colors.pink,
              child: ListView.builder(
                itemCount: itemBag.length,
                itemBuilder: (context, index) => Container(
                  color: Colors.black,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: Image.asset(itemBag[index].imgUrl),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(itemBag[index].title),
                            Text(itemBag[index].shortDescription),
                            Row(
                              children: [Text('\$${itemBag[index].price}')],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // child: Image.asset(product[getIndex].imgUrl),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.red,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.indigo,
            ),
          ),
        ],
      ),
      // ),
    );
  }
}
