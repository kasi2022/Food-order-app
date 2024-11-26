import 'package:flutter/material.dart';
import 'package:food_order_app/conast.dart';
import 'package:food_order_app/models/bottom_baritems.dart';
import 'package:food_order_app/views/cart.dart';
import 'package:food_order_app/views/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex=0;
  List selectedPage=[
    const HomePage(),
      const Cart(),
   const Center(child:Text("Explore")),
   const Center(child:Text("ProfileScreen")),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbgColor,
      bottomNavigationBar:Container(
        height: 85,
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...List.generate(bottomiconlist.length,(index)=>
              GestureDetector(
                onTap: (){
                  setState(() {
                     currentIndex=index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Icon(
                        currentIndex == index
                         ?bottomiconlist[index].selected
                         :bottomiconlist[index].unselected,
                         color:kblack,
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle
                        ),
                        width: currentIndex == index ? 7.0: 0.0,
                        height:currentIndex == index ?7.0 :0.0
                      )
                  
                    ],
                  ),
                ),

              ),
            )
          ],
        )
          
       ),
       body: selectedPage[currentIndex],
    );
  }
}