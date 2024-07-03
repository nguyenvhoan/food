import 'package:flutter/material.dart';
import 'package:food_market/page/home/intro_page.dart';
import 'package:food_market/page/home/widgets/real_time_crud.dart';

class MyApp extends StatelessWidget{
  const MyApp ({super.key});
  
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home:RealTimeCrud(),
    );
  }
  
}