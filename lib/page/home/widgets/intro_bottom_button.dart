import 'package:flutter/material.dart';
import 'package:food_market/page/home/add_item_page.dart';
import 'package:food_market/page/home/register_page.dart';
import 'package:food_market/page/home/signIn_page.dart';
import 'package:food_market/page/home/widgets/real_time_crud.dart';

class IntroBottom extends StatelessWidget{
  const IntroBottom({super.key});
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            
            onPressed:() {
              print('thanhcong');
              Navigator.push(context, 
              MaterialPageRoute(builder: (context)=>const SignIn()),
              
              );
            },
            style:  ButtonStyle(
                backgroundColor:const MaterialStatePropertyAll(Color(0xff574E6D)),
                minimumSize: MaterialStatePropertyAll(Size(size.width/2.5, size.height/14)),
            ),
           child: const Text(
              'Sign In',
              style: TextStyle(
                color: Color(0xffDDDDDD),
              ),
           )

           ),
           SizedBox(
            height:size.height*0.3 ,
           ),
           
           ElevatedButton(
            onPressed:() {
              print('thanhcong');
              Navigator.push(context, 
              MaterialPageRoute(builder: (context)=>  RegisterPage()),
              );
            },
            style:  ButtonStyle(
                backgroundColor:const MaterialStatePropertyAll(Color(0xffDDDDDD)),
                minimumSize: MaterialStatePropertyAll(Size(size.width/2.5, size.height/14)),
            ),
           child: const Text(
              'Register',
              style: TextStyle(
                color: Color(0xff574E6D),
              ),
           )
           )
        ],
    );
  }
  
}