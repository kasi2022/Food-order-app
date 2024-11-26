import 'package:flutter/material.dart';
import 'package:food_order_app/provider/cart.provider.dart';
import 'package:food_order_app/views/appondorpage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (create)=>CartProvider())
      ],
      child: const MaterialApp(
      
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: AppOnBordPage(),
        ),
      ),
    );
  }
}