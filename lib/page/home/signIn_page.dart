import 'package:flutter/material.dart';
import 'package:food_market/page/home/widgets/signIn_content.dart';
import 'package:food_market/page/home/widgets/signIn_icon_top.dart';

class SignIn extends StatelessWidget{
  const SignIn({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      
      appBar: AppBar(
        backgroundColor:const Color(0xff574E6D),
        foregroundColor: Colors.white,
        
        
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
        child:const SingleChildScrollView(
          child:  Column(
            children: [
               
             
              SignInIcon(),
              SignInContent(),
            ],
          ),
        ),
      ),
    );
  }
  
}