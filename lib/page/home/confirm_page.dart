
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:food_market/models/database_service.dart';
import 'package:food_market/models/discount.dart';
import 'package:food_market/page/home/cart_page.dart';
import 'package:food_market/page/home/home_page.dart';

import 'package:food_market/page/payment.dart';

class ConfirmPage extends StatefulWidget {
   ConfirmPage({super.key, required this.account, required this.diss});
  String account;
  List<DiscountABC> diss=[];
  
  @override
  State<ConfirmPage> createState() => _ConfirmPageState();
}

List<int> gia=[0,0,0,0,0,0,0,0,0,0];

String id="";
class _ConfirmPageState extends State<ConfirmPage> {
  
  DatabaseService databaseService = DatabaseService();
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    final databaseReference = FirebaseDatabase.instance.ref('Account').child(widget.account).child('Cart');
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
    body: Column(
        children: [
          Expanded(
              child: FirebaseAnimatedList(
                
                  query: databaseReference,
                  itemBuilder: (context, snapshot, index, animation) {
                    gia[animation]=int.parse(snapshot.child('pricetotal').value.toString());
                    return GestureDetector(
                      onTap: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateCauthu(id: snapshot.child('nameCLB').value.toString())));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          
                        ),
                        // color: Color(color),
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          title: Text(
                            snapshot.child("name").value.toString(),
                            
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          subtitle:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Giá gốc : '+snapshot.child("price").value.toString()+'đ'),
                              Text('Số lượng : '+snapshot.child("quant").value.toString()+'món'),
                              Text('Tổng giá tiền : '+snapshot.child("pricetotal").value.toString()+'đ'),
                        
                              // Text('Số lượng cầu thủ : ${snapshot.child('soLuong').value.toString()}'),
                              
                            ],
                          ),
                              
                          leading: CircleAvatar(
                            radius: 50,
                              child: ClipOval(
                                child: Image.network(snapshot.child('image').value.toString(),),
                              ),
                            
                          ),
                          
                          trailing: PopupMenuButton(
                            offset: Offset(0, 50),
                            elevation: 2,
                            iconSize: 30.0,
                            color: Color(0xff574E6D),
                            shadowColor: Colors.black,
                            icon: const Icon(Icons.more_vert),
                            itemBuilder: (context) => [
                              // For Update Operation
                              PopupMenuItem(
                                
                                height: 10,
                                value: 1,
                                child: ListTile(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart(account: widget.account, diss: widget.diss,)));
                                  },
                                  leading: const Icon(Icons.edit, color: Colors.white,),
                                  title: const Text("Chỉnh sửa ", style: TextStyle(color: Colors.white  ),),
                                ),
                              ),
                              // For Delete Operation
                              
                            ],
                          ),

                        ),
                      ),
                    );
      
                  })),
                  
                   
                  TextField(
                    
                    controller: name,
                    decoration: InputDecoration(
                      labelText: 'Nhập mã giảm giá: '
                    ),
                  ),SizedBox(height: 5,),
                   
                  SizedBox(height: 5,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      ElevatedButton( 
                      onPressed: (          
                    ){
                      setState(() {   
                      });
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateBattle()));
                    },
                     child: Text('Cập nhật giá : '+(gia[0]+gia[1]+gia[2]+gia[3]+gia[4]+gia[5]+gia[6]+gia[7]+gia[8]+gia[9]).toString()+'đ', style: TextStyle(color: Colors.black),),
                     style:  ButtonStyle(
                                    // backgroundColor:const MaterialStatePropertyAll(Color(0xff574E6D)),
                                    // minimumSize: MaterialStatePropertyAll(Size(size.width, size.height/16))
                                    ),
                     ),
                     ElevatedButton(onPressed: (){
                    id = DateTime.now().microsecond.toString();
                   for(int i =0; i<diss.length;i++){
                      if(name.text==diss[i].ma){
                        print(diss[i].per);
                        FirebaseDatabase.instance.ref('Account').child(widget.account).child('History').child('HistoryCart').child(id).set({
                      'total': ((gia[0]+gia[1]+gia[2]+gia[3]+gia[4]+gia[5]+gia[6]+gia[7]+gia[8]+gia[9])*(100-diss[i].per)/100),
                      
                    }
                    );
                    print('Su dung ma giam gia thanh cong');
                      }
                      else {
                        FirebaseDatabase.instance.ref('Account').child(widget.account).child('History').child('HistoryCart').child(id).set({
                      'total': (gia[0]+gia[1]+gia[2]+gia[3]+gia[4]+gia[5]+gia[6]+gia[7]+gia[8]+gia[9]),
                    });
                      }
                    }
                    
                    databaseService.createHis(widget.account,id);
                    
                    
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Payment(account: widget.account,)));
                      // databaseReference.remove();
                      
                  }, child: Text('Xac nhan mua hang', style: TextStyle(color: Colors.black),)),
                    ] 
                  )
        ]
      ),
  );
  }
}