import 'package:flutter/material.dart';
import 'package:food_market/page/admin/admin_category.dart';
import 'package:food_market/page/admin/admin_dis.dart';
import 'package:food_market/page/admin/admin_product.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        SizedBox(height: 100,),
        GestureDetector(onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminProduct()) );
        },
          
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 98, 52, 49),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Text('Product', style: TextStyle(color: Colors.white, fontSize: 20),))
          ),
          Text('-------------------------------------------------------------------------'),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminDis()) );
          },
          child: Container(
            
            alignment: Alignment.center,
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 98, 52, 49),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Text('Discount', style: TextStyle(color: Colors.white, fontSize: 20),))
          ),
          Text('-------------------------------------------------------------------------'),
            
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminCate()) );
          },
          child: Container(
            
            alignment: Alignment.center,
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 98, 52, 49),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Text('Category', style: TextStyle(color: Colors.white, fontSize: 20),))
          ),
          Text('-------------------------------------------------------------------------'),
        
        
      ],),
    );
  }
}