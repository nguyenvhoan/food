

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_market/page/home/home_page.dart';
import 'package:food_market/page/home/register_page.dart';
import 'package:food_market/page/home/widgets/navigation_menu.dart';

class SignInContent extends StatefulWidget{
  const SignInContent({super.key});

  @override
  State<SignInContent> createState() => _SignInContentState();
}

class _SignInContentState extends State<SignInContent> {
  bool _obscureText = true;
  final _formkey = GlobalKey<FormState>();
  final databaseReference = FirebaseDatabase.instance;
    String email="", password="";
    TextEditingController emailController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();
    signIn()async{
      try{
         String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
      print('User ID: $userId');
      


        await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>NavigationMenu(account:  FirebaseAuth.instance.currentUser?.uid ?? '',)));

      }
      on FirebaseAuthException catch (e){
        if(e.code=='user-not-found'){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No User Found For That Email',
          style: TextStyle(fontSize: 18),
          ),
          backgroundColor: Colors.orangeAccent,

          ));
          
        }
        else if(e.code=='wrong-password'){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text( 'Wrong Password Provide by User',
          style: TextStyle(fontSize: 18),
          ),
          backgroundColor: Colors.orangeAccent,
          ),
          );
        }
      }
    }
  @override
  Widget build(BuildContext context) {
    
    var size = MediaQuery.sizeOf(context);
    
    
    
    return SingleChildScrollView(
      scrollDirection:Axis.vertical,
      padding: MediaQuery.of(context).viewInsets,
      child: Form(
        key: _formkey,
        child: Padding(
          
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            
            children: [
              TextFormField( 
                validator: (value){
                  if(value==null||value.isEmpty){
                    return 'Hãy nhập gmail';
                  }
                },
                controller: emailController,
                style:const TextStyle(
                color: Colors.white,
                
              ),
                decoration: InputDecoration(
                  
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:const BorderSide(
                      color: Colors.green,
                      width: 2,
                    )  
                  ),
                  
                  labelText: 'Email',
                  labelStyle: const TextStyle(
                    color: Colors.white, // Thay đổi màu của labelText
                  ),
                            prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
                
              ),
              SizedBox(
                height: size.height/50,
              ),
              TextFormField(
                
                obscureText: _obscureText,
                validator: (value){
                  if(value==null||value.isEmpty){
                    return 'Hãy nhập password';
                  }
                },
                controller: passwordController,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      strokeAlign: 50,
                    ),
                  ),
                  labelText: 'Password',
                  labelStyle: const TextStyle(
                    color: Colors.white, // Thay đổi màu của labelText
                  ),
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  suffixIcon:  IconButton(
                   icon: Icon(Icons.visibility),
                    color: Colors.white,
                    onPressed: (){
                      setState(() {
                        _obscureText=!_obscureText;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: size.height/80,
              ),
               GestureDetector(
                onTap: (){
                  
                  Navigator.push(context, 
                MaterialPageRoute(builder: (context)=> RegisterPage()),
                
                );
                },
                 child: const  Text('Forgot passowrd?',
                             style: TextStyle(
                  color:Colors.red,
                             ),
                             ),
               ),
              SizedBox(
                height: size.height/8,
              ),
              GestureDetector(
                onTap:  () {
                  if(_formkey.currentState!.validate()){
                    setState(() {
                      email=emailController.text;
                      password=passwordController.text;
                    });
                    
                    signIn();
                    print('ccc');
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: size.height / 14,
                  width: size.width / 1,
                  decoration: BoxDecoration(
                    color:  Color(0xffDDDDDD),
                    borderRadius: BorderRadius.circular(20),
                    
                    // minimumSize: MaterialStatePropertyAll(Size(size.width / 1, size.height / 14)),
                  ),
                  child: const Text(
                    'Log In',
                    style: TextStyle(
                      color: Color(0xff574E6D),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}