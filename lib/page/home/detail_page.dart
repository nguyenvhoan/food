import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_market/models/database_service.dart';
import 'package:food_market/models/product.dart';
import 'package:food_market/models/cart.dart';
import 'package:food_market/page/home/cart_page.dart';

class DetailPage extends StatelessWidget {
  Product product;
  String account;
  DatabaseService _databaseService=DatabaseService();
   DetailPage({super.key, required this.product, required this.account});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xff574E6D) ,
        foregroundColor: Colors.white,
        actions: [
          IconButton(onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Đã thêm vào yêu thích'),
            duration: Duration(seconds: 3),
            action: SnackBarAction(
            label: 'Đóng',
            onPressed: () {
              // Xử lý khi người dùng bấm vào nút Đóng
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
            )
            )
            );
            final databaseReference = FirebaseDatabase.instance.ref('Account').child(account).child('Like').child(product.name).set({
                'id':product.id,
                'name':product.name,
                'category':product.category,
                'image':product.image,
                'des':product.des
            });

          },
           icon: Image.asset('asset/images/icons/like.png'))
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

           Image.network(product.image, width: double.infinity,height: 100,),
             Text(product.name, style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.left,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center, 
              children:[
              Text('25k bình luận',style: TextStyle(fontSize: 15,color: Colors.white),),
              Icon(Icons.chevron_right, color: Colors.white,),
            ] 
            
            ),
            Padding(
            padding: EdgeInsets.all(30),
             child:  Column(  
              
                children: [
                  
                  Text('Giới thiệu về ${product.name}', style: TextStyle(fontSize: 13,color: Colors.white),),
                  SizedBox(height: 20,),
                  Text('${product.des}',
                  style: TextStyle(fontSize: 13,color: Colors.white),
                  )
                ],
              ),
           ),SizedBox(height: 100,),
           Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 43,),
                      Text('Price : ', style: TextStyle(color: Color(0xffC3E7B6)),),
                      Text(product.price.toString()+'đ',style: TextStyle(color: Color(0xffBFB6B6))),
                    ],
                  ),
                  
                ],
              ),
              GestureDetector(
                    onTap: (){
                      final id =DateTime.now().microsecond.toString();
                      
                      
                      CartABC cart = CartABC(
                        id: id, 
                        name: product.name, 
                        price: product.price, 
                        quantity: 1,
                        pricetotal: product.price*1,
                        image: product.image,
                        );
                      _databaseService.addtocart(cart, account);
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context)=> Cart(account: account,)),
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
