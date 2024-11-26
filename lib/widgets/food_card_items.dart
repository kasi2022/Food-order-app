import 'package:flutter/material.dart';
import 'package:food_order_app/conast.dart';
import 'package:food_order_app/models/product_model.dart';
import 'package:food_order_app/provider/cart.provider.dart';
import 'package:provider/provider.dart';

class FoodProductItemsCard extends StatelessWidget {
  final MyProductModel productdetails;
  const FoodProductItemsCard({super.key, required this.productdetails});
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CartProvider cartProvider =Provider.of<CartProvider>(context);
    return Stack(
      children: [
        Container(
          height: 300,
          width: size.width / 2.4,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.rotate(angle: 10 / 180),
                SizedBox(
                  height: 160,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                          child: Container( 
                        height: 50,
                        width: 100,
                        decoration:
                            BoxDecoration(shape: BoxShape.circle, boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 10,
                              blurRadius: 30)
                        ]),
                      )),
                                      const SizedBox(
                  height: 10,
                ),

                      Image.asset(productdetails.image)
                    ],
                  ),
                ),
                Text(
                  maxLines: 1,
                  productdetails.name,
                  style: const TextStyle(
                      fontSize: 19, fontWeight: FontWeight.bold, color: kblack),
                ),
                const SizedBox(
                  height: 10,
                ),
                 Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Row(
                      children: [
                      const  Icon(
                          Icons.star_rate_rounded,
                          color: kyellow,
                          size: 22,
                        ),
                      Text(productdetails.rate.toString(), style: const TextStyle(
                  color: Colors.black,
                ),),
                    Container(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: kpink,
                            size: 20,
                          ),
                          Text(
                            "${productdetails.distance}m",
                            style:const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
               
              ],
            ),
          
        const SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(
                  "\$${(productdetails.price).toStringAsFixed(2)}",
                  style: const TextStyle(
                    color: kblack,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
           GestureDetector(
            onTap: (){
              // addcart
              cartProvider.addCart(productdetails);
            },
             child: Container(
              height: 40,
              width: 50,
              decoration:const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                ),
                
              ),
              child:const Icon(Icons.shopping_cart,color: Colors.white,),
             ),
           )
              
          ],
        ),
      ],
      )))]);
  }
}

