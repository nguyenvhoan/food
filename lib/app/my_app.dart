import 'package:flutter/material.dart';
import 'package:food_market/page/admin/admin_category.dart';
import 'package:food_market/page/admin/admin_product.dart';
import 'package:food_market/page/home/home_page.dart';
import 'package:food_market/page/home/intro_page.dart';
import 'package:food_market/page/home/widgets/real_time_crud.dart';
import 'package:food_market/page/home/widgets/test.dart';

class MyApp extends StatelessWidget{
  const MyApp ({super.key});
  
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home:HomePage(),
    );
  }
  
}