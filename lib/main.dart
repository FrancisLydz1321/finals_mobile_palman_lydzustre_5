import 'package:finals_mobile_palman_lydzustre_5/views/detail_page.dart';
import 'package:finals_mobile_palman_lydzustre_5/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: DetailPage(),
      home: HomePage(),
    ),
  ));
}
