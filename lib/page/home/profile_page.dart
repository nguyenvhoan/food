import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
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
        
          child: Stack(
            children: [
               Container(
          margin: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
          
          width: double.infinity,
          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            border: Border.all(
              color: const Color(0xffD1D1D6), 
              width: 2.0, // Đặt độ rộng border là 2 điểm
            ),
          ),
          child: Column(
            children:[
              SizedBox(height: 80,), 
              Container(
                height: 80,
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                  
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0
                  )
                ),
              child: Text('Nguyễn Văn Hoàn', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 5,), 
              Container(
                
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                  
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0
                  )
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Row(
                    
                      children:[
                        SizedBox(width: 15,),
                      Image.asset('asset/images/icons/icon_setting.png'),
                      Text('Setting', style: TextStyle(fontSize: 20),)
                    ] ),

                    SizedBox(height: 10,),
                    Row(
                    
                      children:[
                        SizedBox(width: 15,),
                      Image.asset('asset/images/icons/icon_like.png'),
                      Text('Rate our app', style: TextStyle(fontSize: 20),)

                      
                    ] ),
                    
                    SizedBox(height: 10,),
                    Row(
                    
                      children:[
                        SizedBox(width: 15,),
                      Image.asset('asset/images/icons/icon_term.png'),
                      Text('Terms & Conditions', style: TextStyle(fontSize: 20),)

                      
                    ] ),
                    SizedBox(height: 10,),
                    Row(
                    
                      children:[
                        SizedBox(width: 15,),
                      Image.asset('asset/images/icons/icon_help.png'),
                      Text('Help', style: TextStyle(fontSize: 20),)

                      
                    ] ),
                    SizedBox(height: 10,),
                    Row(
                    
                      children:[
                        SizedBox(width: 15,),
                      Image.asset('asset/images/icons/icon_logout.png'),
                      Text('Log-Out', style: TextStyle(fontSize: 20),)

                      
                    ] ),SizedBox(height: 30,)
                  ],
                ),
            ),
            
              
            ]
          ),

               ),
              Positioned(
                right: size.width/3.2,
                top: 15, // Di chuyển hình ảnh lên 20 điểm
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'asset/images/avatar/image.png',
                    height: 150,
                    width: 150,
                  ),
                ),
              ),
            ]
        ),
      )
      
    );
    
  }
}