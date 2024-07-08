import 'dart:math';

import 'package:firebase_database/firebase_database.dart';

import 'package:food_market/models/product.dart';
import 'package:food_market/models/category.dart';

class DatabaseService {
  final _real = FirebaseDatabase.instance;
//----------category
  Future<void> createCate(Category cate) async {
    try {
      String name = cate.nameCate;
      await _real.ref("Category").child("name $name").set(cate.toMap());
      
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> readCateData(List<Category> lstCategory) async {
    try {
      final data = await _real.ref("Category").once();
      final snapshots = data.snapshot.children;
      
      for (final snapshot in snapshots) {
    final id = snapshot.key;
    final name = snapshot.child('nameCate').value as String;
    
    final category = Category(
    idCate: id!,
    nameCate: name,
    
  );
  print(category.toMap());
  lstCategory.add(category);
  }
    } catch (e) {
      print(e.toString());
    }
  }



//-------product
  Future<void> create(Product pro) async {
    try {
      String name = pro.name;
      await _real.ref("Product").child("name $name").set(pro.toMap());     
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> readProductData(List<Product> lstProduct) async {
    
    try {
      final data = await _real.ref("Product").once();
      final snapshots = data.snapshot.children;
      var pro; 
      for (final snapshot in snapshots) {
    final id = snapshot.key;
    final name = snapshot.child('name').value as String;
    final category = snapshot.child('category').value as String;
    final image = snapshot.child('image').value as String;
    final price = snapshot.child('price').value as int;
    final product = Product(
    id: id!,
    name: name,
    category: category,
    image: image,
    price: price,
  );
  print(product.toMap());
  lstProduct.add(product);
  }
    } catch (e) {
      print(e.toString());
    }
  }
}