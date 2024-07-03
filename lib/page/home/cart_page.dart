import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Color(0xff574E6D),
      foregroundColor: Colors.white,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Image.asset('asset/images/icons/like.png'),
        )
      ],
    ),
    body: Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff574E6D),
            Color.fromARGB(255, 23, 20, 32),
          ],
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Card_Item_Cart(size: size),
                  Card_Item_Cart(size: size),
                  Card_Item_Cart(size: size),
                  Card_Item_Cart(size: size),
                  Card_Item_Cart(size: size),
                  Card_Item_Cart(size: size),
                ],
              ),
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              return Positioned(
                bottom: 0,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20) ,
                  width: constraints.maxWidth,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Color(0xffDDDDDD),
                  ),
                  child:  Column(
                    children: [
                      SizedBox(height: 20,),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Dưa leo'),
                          Text('30.000đ'),
                        ],
                      ),
                      const SizedBox(width: 20),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Dưa chuột'),
                          Text('30.000đ'),
                        ],
                      ),
                     const SizedBox(width: 20),
                     const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Burger'),
                          Text('30.000đ'),
                        ],
                      ),
                      GestureDetector(
                        
                        onTap: (){},
                        child: Container(
                          alignment: Alignment.center,
                          height: size.height/15,
                          width: size.width/4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xff43405D),
                          ),
                          child: Text('Buy now', style: TextStyle(color: Colors.white),),
                        ),
                      ),
                      SizedBox(height: 5,)
                    ],
                  ),

                ),
              );
            },
          ),
        ],
      ),
    ),
  );
}
}
class Card_Item_Cart extends StatelessWidget {
  const Card_Item_Cart({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: size.width/1.2,
      height: size.height/6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xffDDDDDD),
      ),
      child: Row(
      
        children: [
            Image.asset('asset/images/avatar/dualeo.png'),
        Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children:[
           Text('Dưa leo', style: TextStyle(fontSize: 17,color: Color(0xff43405D)),textAlign: TextAlign.left,),
          
            SizedBox(height: 60,),
           Row(
             children:[ const 
             Column(
              children: [
                Row(
                  children: [
                    
                    Text('Price : ', style: TextStyle(color: Color(0xff43405D), fontSize: 12),),
                    Text('30.000đ',style: TextStyle(color: Color(0xff43405D),fontSize: 12)),
                  ],
                ),
                Text('27.000đ', style: TextStyle(color: Color(0xff43405D),fontSize: 12, fontWeight: FontWeight.bold),)
              ],
    
                           ),
                           SizedBox(width: 10,),
                           Container(
                                height: 20,width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20) ,
                                  color: Color(0xff574E6D),
                                ),
                                child: Image.asset('asset/images/icons/kkk.png'
                                ),
                           )
                           ]
           ),
        ] ),
             
            
        ],
      ),
    );
  }
}