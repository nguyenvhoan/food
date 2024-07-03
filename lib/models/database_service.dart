import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:food_market/models/product.dart';

class DatabaseService{
  final _real= FirebaseDatabase.instance;
   create(Product pro) async{
    try{
      
      String name=pro.name;
      _real.ref("Product").child("name $name").set(pro.toMap());
      final data = await _real.ref("product").once();
        for(int i =0; i<data.snapshot.children.length;i++){
          print(data.snapshot.children.toList()[i].value.toString());
          print('-------------------------'  );
          
        }
    }
    catch( e){
      print(e.toString());
    }
    
    Future read() async{
      try{
        final data = await _real.ref("product").once();
        for(int i =0; i<data.snapshot.children.length;i++){
          log(data.snapshot.children.toList()[i].value.toString() as num);
          log('-------------------------' as num);
          
        }
      }
      catch(e){
        log(e.toString() as num);
      }
    }
    
  }
}