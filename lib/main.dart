import 'package:api_integration_demo/models/product_models.dart';
import 'package:api_integration_demo/views/homepageview.dart';
import 'package:api_integration_demo/widgets/single_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key, this.product,});
  final ProductModel? product;
   // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API INTEGRATION DEMO',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: HomePageView(),
      routes: {
        '/second' : (context) => SingleProduct(product),
      }
    );
  }
}