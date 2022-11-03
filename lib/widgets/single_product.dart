import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/product_models.dart';

class SingleProduct extends StatelessWidget{
  final ProductModel? product;
  SingleProduct(this.product);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      width: MediaQuery.of(context).size.width,
      child: Column(mainAxisSize: MainAxisSize.min,mainAxisAlignment: MainAxisAlignment.end,

        children: [
          CachedNetworkImage(imageUrl: product!.image,height: 400,),
          SizedBox(height: 15,),
          Text(product!.title,style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
          SizedBox(height: 15,),
          Text(product!.price.toString(),style: TextStyle(fontSize: 20),),
          SizedBox(height: 15,),
          Text(product!.description,style: TextStyle(fontSize: 18),),
        ],
      ),
    );
  }

}
