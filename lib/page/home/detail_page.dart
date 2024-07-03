import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_market/page/home/cart_page.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xff574E6D) ,
        foregroundColor: Colors.white,
        actions: [
          IconButton(onPressed: (){}, icon: Image.asset('asset/images/icons/like.png'))
        ],
      ),
      body: Container(
        
        alignment: Alignment.center,
        decoration:const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff574E6D),
              Color.fromARGB(255, 23, 20, 32),
            ]
          )
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Image.asset('asset/images/avatar/dualeo.png'),
            const Text('Dưa leo', style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.left,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center, 
              children:[
              Text('25k bình luận',style: TextStyle(fontSize: 15,color: Colors.white),),
              Icon(Icons.chevron_right, color: Colors.white,),
            ] 
            
            ),
           const Padding(
            padding: EdgeInsets.all(30),
             child:  Column(  
              
                children: [
                  
                  Text('Giới thiệu về dưa leo', style: TextStyle(fontSize: 13,color: Colors.white),),
                  SizedBox(height: 20,),
                  Text('Dưa leo có tác dụng giúp thanh nhiệt, giải phiền, lợi thủy đạo, giảm viêm họng, đau rát cổ họng, giúp giảm cân, điều hòa mức cholesterol, làm đẹp da',
                  style: TextStyle(fontSize: 13,color: Colors.white),
                  )
                ],
              ),
           ),SizedBox(height: 100,),
           Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 43,),
                      Text('Price : ', style: TextStyle(color: Color(0xffC3E7B6)),),
                      Text('30.000đ',style: TextStyle(color: Color(0xffBFB6B6))),
                    ],
                  ),
                  Text('27.000đ', style: TextStyle(color: Color(0xffC3E7B6)),)
                ],
              ),
              GestureDetector(
                    onTap: (){
                      Navigator.push(context, 
                MaterialPageRoute(builder: (context)=>const Cart()),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                  height: size.height / 14,
                  width: size.width / 2.5,
                  decoration: BoxDecoration(
                      color: Color(0xffC3E7B6),
                      borderRadius: BorderRadius.circular(20)
                    ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Add to cart'),
                          Image.asset('asset/images/icons/Vector.png')
                        ],
                      ),
                    ),
                  )
            ],
           )
          ],
        ),
        
      ),
        
    );
  }
}
