import 'package:flutter/material.dart';
import 'package:food_market/models/category.dart';
import 'package:food_market/models/database_service.dart';
import 'package:food_market/models/product.dart';
import 'package:food_market/page/home/widgets/real_time_crud.dart';

class BottomOptionCategory extends StatefulWidget {
  
   BottomOptionCategory({
    super.key,
    
    
  });

  @override
  State<BottomOptionCategory> createState() => _BottomOptionCategory();
}
final DatabaseService _databaseService= DatabaseService();

TextEditingController nameController= TextEditingController();



class _BottomOptionCategory extends State<BottomOptionCategory> {

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
           
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed:() {
                  final id =DateTime.now().microsecond.toString();
                  final category = Category(idCate: id,nameCate: nameController.text);
                  _databaseService.createCate(category);
                  List<Category> lstCategory= [];
                  _databaseService.readCateData(lstCategory);
                  nameController.clear();
                  setState(() {
                    
                  });
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




