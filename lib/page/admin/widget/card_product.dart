import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget
{
   CardProduct({super.key, required this.item});
  var item;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
               
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                color:const Color(0xff574E6D),),
                child: Column(
                  children: [
                    Image.asset('asset/images/avatar/${item.image}', width: 120,height: 120,),
                    Text(item.name,
                    style:const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                         Text(item.price.toString(), style:const TextStyle(
                          color: Color(0xffD5FFC3))
                        ),
                        Image.asset('asset/images/icons/like.png')
                      ]
                        )
                      ],
                    )
     );
  }
  
}