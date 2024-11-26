import 'package:flutter/material.dart';
import 'package:food_order_app/conast.dart';
import 'package:food_order_app/models/catogerys_model.dart';
import 'package:food_order_app/models/product_model.dart';
import 'package:food_order_app/provider/cart.provider.dart';
import 'package:food_order_app/views/cart.dart';
import 'package:food_order_app/widgets/food_card_items.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String category = "";
  List<MyProductModel> productModel = []; // start iwth an empty list
  @override
  void initState() {
    super.initState();
    // set the initial category to the first item in myCategories and initially display the first category
    if (myCategories.isNotEmpty) {
      category = myCategories[0].name;
      filterProductByCategory(category);
    }
  }

  void filterProductByCategory(String selectedCayegory) {
    setState(() {
      category = selectedCayegory;
      productModel = myProductModel
          .where(
            (element) =>
                element.category.toLowerCase() ==
                selectedCayegory.toLowerCase(),
          )
          .toList();
    });
      
  }
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                const Expanded(
                    child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Your location",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black,
                          size: 20,
                        )
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: korange,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Chennai India",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    )
                  ],
                )),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)),
                      child: const Padding(
                        padding:  EdgeInsets.all(20),
                        child: Icon(Icons.search),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Stack(alignment: Alignment.topCenter, children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Padding(
                            padding: EdgeInsets.all(20),
                            child: Icon(Icons.shopping_cart_checkout_outlined),
                          ),
                        ),
                      ),
                        cartProvider.carts.isNotEmpty
                            ? Positioned(
                                right: 0,
                                top: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Cart(),
                                      ),
                                    );
                                  },
                            child: Container(
                              width: 30,
                              height: 32,
                              margin: const EdgeInsets.symmetric(vertical: 15),
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  color: Color(0xfff95f60),
                                  shape: BoxShape.circle),
                              child:  Center(
                                  child: Text(
                                    maxLines: 1,
                                "${cartProvider.carts.length}",
                                style:const TextStyle(color: Colors.white,fontSize: 10),
                              )),
                            ),
                          ))
                                                      : Container(),

                ]),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Lets finds the best food around you",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5,
                  color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Find by Catogery",
                  style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold, color:Colors.black),
                ),
                Text(
                  "See All ",
                  style: TextStyle(color: korange,fontSize: 22),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(padding:const EdgeInsets.symmetric(horizontal: 5)
         ,child: Row(children: [
          ...List.generate(myCategories.length, (index)=>
          GestureDetector(
             onTap: (){
                        filterProductByCategory(myCategories[index].name);

             },
             child: 
                SingleChildScrollView(
                  child: Container(
                  height: 105,
                  width: 95,
                  margin: EdgeInsets.all(2),
                  decoration:  BoxDecoration(
                    color: Colors.white,
                    border: category == myCategories[index].name ?
                    Border.all(width: 2.5,color: korange):
                    Border.all(color: Colors.white)
                  ),
                  child: Column(
                    
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: kblack.withOpacity(0.4),
                                          offset: const Offset(0, 10),
                                          blurRadius: 12,
                                          spreadRadius: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                           ]
                      ),
                    
                    Image.asset(myCategories[index].image,width: 45,fit: BoxFit.cover,),
                   const SizedBox(height: 10),
                  ],),
                                 ),
                ),
             ),
          ),
         
          
         ],),
         ),
          const SizedBox(height: 25,),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text("Result (${productModel.length})",
          
          style: const TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),)
          ),
         const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                ...List.generate(
                  productModel.length,
                  (index) => Padding(
                    padding: index == 0
                        ? const EdgeInsets.only(left: 25, right: 25)
                        : const EdgeInsets.only(right: 25),
                    child: FoodProductItemsCard(
                     productdetails : productModel[index],
                    ),
                  ),
                ),    ],),
        ),
        ])));
      
    
  }
}
