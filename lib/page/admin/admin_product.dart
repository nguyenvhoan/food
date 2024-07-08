import 'package:flutter/material.dart';
import 'package:food_market/models/database_service.dart';
import 'package:food_market/models/product.dart';
import 'package:food_market/page/admin/widget/card_product.dart';
import 'package:food_market/page/home/detail_page.dart';
import 'package:food_market/page/home/widgets/bottom_card.dart';
import 'package:food_market/page/home/widgets/home_card.dart';

// ignore: must_be_immutable
class AdminProduct extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<AdminProduct> {
  final _databaseService = DatabaseService();
  List<Product> items = []; // Khai báo items là một danh sách rỗng

  @override
  void initState() {
    super.initState();
    _loadProductData(); // Gọi hàm để đọc dữ liệu sản phẩm từ DatabaseService
  }

  Future <void> _loadProductData() async {
    await _databaseService.readProductData(items);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // Sử dụng items để xây dựng giao diện
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title:const Text('Product', style: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold
        ),),
      ),
      body: Container(margin: EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        child: GestureDetector(
          
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailPage()));
          },
          child: Column(
            children: [
              const Text(
                'Cate',
                style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold
                ),
              ),
              hoSrcoll(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
  child: Icon(Icons.add),
  onPressed: (){
    showModalBottomSheet(context: context, builder: (BuildContext content){
      return BottomCard();
    });
  }
),
    );
  }

  SingleChildScrollView hoSrcoll() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: items.map((item) => CardProduct(item: item)).toList(),
      ),
    );
  }
}