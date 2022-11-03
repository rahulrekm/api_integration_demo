import 'package:api_integration_demo/widgets/single_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../product_controller/product_controller.dart';
import '../widgets/produt_tile.dart';

class HomePageView extends StatelessWidget{

  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       leading: Icon(Icons.arrow_back_ios),
         actions: [
           IconButton(
             onPressed: () {},
             icon: const Icon(Icons.shopping_cart),
           ),
         ],
     ),

     body: Column(
       children: [
         Padding(
           padding: const EdgeInsets.all(16),
           child: Row(
             children: const [
               Expanded(
                 child: Text(
                   "ShopMe",
                   style: TextStyle(
                       fontFamily: "avenir",
                       fontSize: 32,
                       fontWeight: FontWeight.w900),
                 ),
               ),
             ],
           ),
         ),
         Expanded(
           child: Obx(
                 () {
               if (productController.isLoading.value) {
                 return const Center(child: CircularProgressIndicator());
               } else {
                 return StaggeredGridView.countBuilder(
                   crossAxisCount: 2,
                   itemCount: productController.productList.length,
                   crossAxisSpacing: 16,
                   mainAxisSpacing: 16,
                   itemBuilder: (context, index) {
                     return GestureDetector(onTap: () { 
                       Navigator.of(context).push(MaterialPageRoute(builder:
                       (context) => SingleProduct(productController.productList[index]),

                       ) );
                       print(productController.productList[index]);
                     },
                       /*Get.toNamed('/second',arguments: { 'index':productController.productList[index]});*/
                         child: ProductTile(productController.productList[index]));
                   },
                   staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                 );
               }
             },
           ),
         ),
       ],
     ),
   );
  }

}