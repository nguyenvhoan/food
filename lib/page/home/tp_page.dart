import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class TPPage extends StatelessWidget {
  String account;
 TPPage({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    // final databaseReference = FirebaseDatabase.instance.ref('Account').child(account).child('Cart').remove();
    
    return Scaffold(
      body: Container(alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[ 
          const Text('Đơn hàng của bạn đang được xác nhận và sẽ được giao hàng đến nơi trong thời gian sớm nhất',
        textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold), ),
        SizedBox(height: 20,),
        GestureDetector(
          onTap: (){},
          child:Container(
            padding: EdgeInsets.all(20),
            child: Text('Quay về trang chủ'),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.red
            ),

          ),
        ),
        ]
      ),
      )
      
    );
  }
}