import 'package:flutter/material.dart';
import 'package:food_market/page/admin/admin_category.dart';
import 'package:food_market/page/admin/admin_dis.dart';

import 'package:food_market/page/admin/admin_product.dart';
import 'package:food_market/page/home/home_page.dart';
import 'package:food_market/page/home/signIn_page.dart';
import 'package:food_market/page/home/widgets/navigation_menu.dart';
import 'package:food_market/page/payment.dart';


class MyApp extends StatelessWidget{
  const MyApp ({super.key});
  
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SignIn(),
    );
  }
  
}