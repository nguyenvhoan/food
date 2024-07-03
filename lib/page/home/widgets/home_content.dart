import 'package:flutter/material.dart';
import 'package:food_market/models/item.dart';
import 'package:food_market/page/home/detail_page.dart';
import 'package:food_market/page/home/widgets/home_card.dart';

// ignore: must_be_immutable
class HomeContent extends StatelessWidget{
   HomeContent({super.key,required this.cate});
  
 final List<DataItem> items =[
    DataItem(id: '1', name: 'Dưa leo', price: 30000, img: 'dualeo.png',category: 'Thực vật'),
    DataItem(id: '2', name: 'Dưa chuột', price: 30000, img: 'dualeo.png',category: 'Thực vật'),
    DataItem(id: '3', name: 'Dưa leo', price: 30000, img: 'dualeo.png',category: 'Thực vật'),
    DataItem(id: '4', name: 'Dưa chuột', price: 30000, img: 'dualeo.png',category: 'Thực vật'),
    DataItem(id: '5', name: 'Dưa leo', price: 30000, img: 'dualeo.png',category: 'Thực vật'),
    DataItem(id: '6', name: 'Dưa leo', price: 30000, img: 'dualeo.png',category: 'Thực vật'),

    DataItem(id: '7', name: 'Burger', price: 30000, img: 'Burger.png',category: 'Food'),
    DataItem(id: '8', name: 'Burger', price: 30000, img: 'Burger.png',category: 'Food'),
    DataItem(id: '9', name: 'Burger', price: 30000, img: 'Burger.png',category: 'Food'),
    DataItem(id: '10', name: 'Burger', price: 30000, img: 'Burger.png',category: 'Food'),
    DataItem(id: '11', name: 'Burger', price: 30000, img: 'Burger.png',category: 'Food'),
    DataItem(id: '12', name: 'Burger', price: 30000, img: 'Burger.png',category: 'Food'),
  ];  var cate;
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const DetailPage()));
      },
      child: Column(
              children:[  Text(
                cate,
                style:const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold
                ),
              ),
              hoSrcoll(),
              ]
            ),
    );
  }
  SingleChildScrollView hoSrcoll() {
    
    return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding:const  EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row( 
        children: items.where((item) => item.category == cate).map((item) => HomeCard(item: item)).toList(),
          )
          
         );
  }
  
}