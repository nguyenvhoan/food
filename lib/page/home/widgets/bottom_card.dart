import 'package:flutter/material.dart';
import 'package:food_market/models/database_service.dart';
import 'package:food_market/models/product.dart';
import 'package:food_market/page/home/widgets/real_time_crud.dart';

class BottomCard extends StatefulWidget {
  
   BottomCard({
    super.key,
    
    
  });

  @override
  State<BottomCard> createState() => _BottomCardState();
}
final DatabaseService _databaseService= DatabaseService();

TextEditingController nameController= TextEditingController();

TextEditingController priceController= TextEditingController();

TextEditingController imageController= TextEditingController();

TextEditingController categoryController= TextEditingController();

class _BottomCardState extends State<BottomCard> {

// String title='';
  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
              TextField(
                controller: nameController,             
                // onChanged: (text) {
                //   title=text;
                // },
                decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30) ,
                ),
                labelText: 'Name'

              ),
            ),
            const SizedBox(height: 20,),
            TextField(
                controller: priceController,
                // onChanged: (text) {
                //   title=text;
                // },
                decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30) ,
                ),
                labelText: 'Price'
              ),
            ),
            const SizedBox(height: 20,),
            TextField(
                controller: imageController ,
                // onChanged: (text) {
                //   title=text;
                // },
                decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30) , 
                ),
                labelText: 'Image'  
              ),
            ),
            const SizedBox(height: 20,),
            TextField(
                controller: categoryController,              
                // onChanged: (text) {
                //   title=text;
                // },
                decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30) ,   
                ),
                labelText: 'Category'        
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed:() {
                  final id =DateTime.now().microsecond.toString();
                  final product = Product(id: id, name: nameController.text, category: categoryController.text, image: imageController.text, price: 20000);
                  _databaseService.create(product);
                  
                  nameController.clear();
                  categoryController.clear();
                  imageController.clear();
                    //For Dismiss the keyboard afte adding items
                    Navigator.pop(context);
                },
              child:const Text('Submit')),
            ),
          ],
        ),
      ),
    );
  }
}




