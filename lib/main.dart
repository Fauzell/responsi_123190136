// ignore_for_file: unnecessary_import

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsi_123190136/view/meal_category.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Food Categories',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: const CategoryListPage()
      ),
    );
  }
}
