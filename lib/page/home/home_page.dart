import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_market/models/database_service.dart';
import 'package:food_market/models/product.dart';
import 'package:food_market/page/home/cart_page.dart';
import 'package:food_market/page/home/detail_page.dart';


import 'package:food_market/page/home/widgets/home_content.dart';

class HomePage extends StatefulWidget {
  String account;
   HomePage({super.key, required this.account});
  

  @override
  State<HomePage> createState() => _SearchBarAppState();
  
}
final databaseReference =FirebaseDatabase.instance.ref('Product');
DatabaseService _databaseService= DatabaseService();
final List<Product> list=[]; 
class _SearchBarAppState extends State<HomePage> {
  bool isDark = false;
  List<Product> pro = [];
@override
  void initState() {
    super.initState();
    _loadProductData(); // Gọi hàm để đọc dữ liệu sản phẩm từ DatabaseService
  }
List<Product> items=[];
  Future <void> _loadProductData() async {
    await _databaseService.readProductData(pro);
    setState(() {});
  }
  void update(String value) {
  setState(() {
    items = pro.where((element) => element.name!.toLowerCase().contains(value.toLowerCase())).toList();
  });
}

  @override
  Widget build(BuildContext context) {
    
    final ThemeData themeData = ThemeData(
        useMaterial3: true,
        brightness: isDark ? Brightness.dark : Brightness.light);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){},
          icon: Image.asset('asset/images/icons/menu.png'),
        ),
        actions: [
    
    IconButton(
      icon: Image.asset('asset/images/icons/Cart.png'),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Cart(account: widget.account,)));
        // Xử lý sự kiện khi nhấn vào icon
      },
    ),
  ],  
      ),
        body: Column(
        children: [
          Padding(
  padding: const EdgeInsets.all(8.0),
  child: SearchAnchor(
    builder: (BuildContext context, SearchController controller) {
      return SearchBar(
        onChanged: (value) => update(value),
        controller: controller,
        padding: const MaterialStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(horizontal: 16.0),
        ),
        onTap: () {
          controller.openView();
        },
        leading: const Icon(Icons.search),
        trailing: <Widget>[
          Tooltip(
            message: 'Change brightness mode',
            child: IconButton(
              isSelected: isDark,
              onPressed: () {
                setState(() {
                  isDark = !isDark;
                });
              },
              icon: const Icon(Icons.wb_sunny_outlined),
              selectedIcon: const Icon(Icons.brightness_2_outlined),
            ),
          )
        ],
      );
    },
    suggestionsBuilder: (BuildContext context, SearchController controller) {
      return List<ListTile>.generate(
        items.length,
        (int index) {
          final String item = '${items[index].name.toString()}';
          return ListTile(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            title: Text(item),
            leading: CircleAvatar(
              child: ClipOval(
                child: Image.network(items[index].image),
              ),
            ),
            subtitle: Text('Giá : ${items[index].price}'),
            onTap: () {
              setState(() {
                controller.closeView(item);
              });
            },
          );
        },
      );
    },
  ),
),
          Text('Cơm' ,style: TextStyle(fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold)),
          hoilamgi('Cơm'),
          Text('Nước' ,style: TextStyle(fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold)),
          hoilamgi('Nước Uống'),
                  
        ]
      ),
      ),
    );
  }

  Expanded hoilamgi(String cc) {
    return Expanded(
            child: FirebaseAnimatedList(
                query: databaseReference,
                itemBuilder: (context, snapshot, index, animation) {
                  String test="";
                  if(animation==1){
                    test=cc;
                  }
                  else test="";
                  if(snapshot.child('category').value.toString()==cc){
                    return GestureDetector(
                    onTap: (){
                      Product pro = Product(
                      id: snapshot.child('id').value.toString(), 
                      name: snapshot.child('name').value.toString(), 
                      category: snapshot.child('category').value.toString(), 
                      image: snapshot.child('image').value.toString(), 
                      price: int.tryParse(snapshot.child('price').value.toString()) ?? 0,  
                      des: snapshot.child('des').value.toString(), );
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage(product: pro,account:widget.account)));
                    },
                    child: Column(
                      children:[                      
                        Card(
                          color: Color(0xff574E6D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          
                        ),
                        // color: Color(color),
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          title: Text(
                            snapshot.child("name").value.toString(),
                            
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          subtitle:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Giá : '+snapshot.child("price").value.toString()+'đ',
                              style: TextStyle(color: Colors.white,),),
                              // Text('Số lượng cầu thủ : ${snapshot.child('soLuong').value.toString()}'),
                      
                            ],
                          ),
                              
                          leading: CircleAvatar(
                            radius: 50,
                              child: ClipOval(
                                child: Image.network(snapshot.child('image').value.toString(),
                                                            ),
                              ),
                            
                          ),
                          
                          
                        ),
                      ),
                      ] 
                    ),
                  );
                  }
                  else return Container();
                  
    
                }));
  }

  
}
