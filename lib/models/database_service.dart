

import 'package:firebase_database/firebase_database.dart';
import 'package:food_market/models/account.dart';

import 'package:food_market/models/product.dart';
import 'package:food_market/models/category.dart';
import 'package:food_market/models/cart.dart';
import 'package:food_market/models/history.dart';
import 'package:food_market/page/home/cart_page.dart';


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
    final des = snapshot.child('des').value as String;
    
    final category = Category(
    idCate: id!,
    nameCate: name,
    descript: "ccc",
    img: "ccc"
    
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
    final des = snapshot.child('des').value as String;
    final product = Product(
    id: id!,
    name: name,
    category: category,
    image: image,
    price: price,
    des: des
  );
  print(product.toMap());
  lstProduct.add(product);
  }
    } catch (e) {
      print(e.toString());
    }
  }


  /////carts
    Future<void> addtocart(CartABC cart, String account) async {
      try {
        
        await _real.ref("Account").child(account).child('Cart').child(cart.name).set(cart.toMap());
        
      } catch (e) {
        print(e.toString());
      }
    }

Future<void> createHis(String account,String id2) async {
  try {
    
    final data = await _real.ref("Account/$account/Cart").once();
    final snapshots = data.snapshot.children;
    final id = DateTime.now().microsecond.toString();
    List<CartABC> lst = [];

    for (final snapshot in snapshots) {
      final id1 = DateTime.now().microsecond.toString();
      final id = snapshot.key;
      final name = snapshot.child('name').value as String;
      final price = snapshot.child('price').value as int;
      final pricetotal = snapshot.child('pricetotal').value as int;
      final quant = snapshot.child('quant').value as int;
      final image = snapshot.child('image').value as String;

      final cart = CartABC(
        id: id!,
        name: name,
        price: price,
        pricetotal: pricetotal,
        quantity: quant,
        image: image
      );
      lst.add(cart);
      
      await _real.ref("Account").child(account).child('History').child('HistoryCart').child(id2).child('Cart').child(cart.name).set(cart.toMap());
     
    }
    
    
  } catch (e) {
    print(e.toString());
  }
}


    ///Account
    Future<void> createAccount(Account act) async {
      try {
        
        await _real.ref("Account").child(act.email).set(act.toMap());
        
      } catch (e) {
        print(e.toString());
      }
    }
    
}
