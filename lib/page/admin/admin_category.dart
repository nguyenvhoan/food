import 'package:flutter/material.dart';
import 'package:food_market/models/category.dart';
import 'package:food_market/models/database_service.dart';
import 'package:food_market/page/admin/widget/bottom_option_category.dart';

class AdminCategory extends StatefulWidget {
  const AdminCategory({super.key});

  @override
  State<AdminCategory> createState() => _AdminCategoryState();
}

class _AdminCategoryState extends State<AdminCategory> {
  final _databaseService = DatabaseService();
  List<Category> items = []; // Khai báo items là một danh sách rỗng

  @override
  void initState() {
    super.initState();
    _loadProductData(); // Gọi hàm để đọc dữ liệu sản phẩm từ DatabaseService
  }

  Future <void> _loadProductData() async {
    await _databaseService.readCateData(items);
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      
    backgroundColor: Colors.amber,
    appBar: AppBar(
      backgroundColor: Colors.blue,
      centerTitle: true,
      title: const Text('Category'),
),
    body:ListView.builder(itemCount: items.length,itemBuilder: (context,index){
      final item = items[index];
      return ListTile(
        leading: Icon(Icons.online_prediction),
        title: Text(item.nameCate),
        trailing: PopupMenuButton(
                          icon: const Icon(Icons.more_vert),
                          itemBuilder: (context) => [
                            // For Update Operation
                            PopupMenuItem(
                              value: 1,
                              child: ListTile(
                                onTap: () {
                                  Navigator.pop(context);
                                  // updateBottomSheet(
                                  //   context,
                                  //   snapshot.child("name").value.toString(),
                                  //   snapshot.child("id").value.toString(),
                                  //   snapshot.child("sn").value.toString(),
                                  //   snapshot.child("address").value.toString(),
                                  // );
                                },
                                leading: const Icon(Icons.edit),
                                title: const Text("Edit"),
                              ),
                            ),
                            // For Delete Operation
                            PopupMenuItem(
                              value: 2,
                              child: ListTile(
                                onTap: () {
                                  Navigator.pop(context);
                                  
                                },
                                leading: const Icon(Icons.delete),
                                title: const Text("Delete"),
                              ),
                            ),
                          ],
                        ),
      );     
    }
),
    
floatingActionButton: FloatingActionButton(
  child: Icon(Icons.add),
  onPressed: (){
    showModalBottomSheet(context: context, builder: (BuildContext content){
      return BottomOptionCategory();
    });
  }
),
    );
  }
}