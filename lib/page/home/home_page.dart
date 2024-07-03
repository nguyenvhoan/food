import 'package:flutter/material.dart';
import 'package:food_market/page/home/cart_page.dart';


import 'package:food_market/page/home/widgets/home_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  

  @override
  State<HomePage> createState() => _SearchBarAppState();
  
}

class _SearchBarAppState extends State<HomePage> {
  bool isDark = false;
  

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
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Cart()));
        // Xử lý sự kiện khi nhấn vào icon
      },
    ),
  ],  
      ),
        body: ListView(
          children:[ Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchAnchor(
                builder: (BuildContext context, SearchController controller) {
              return SearchBar(
                controller: controller,
                padding: const MaterialStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 16.0)),
                onTap: () {
                  controller.openView();
                },
                onChanged: (_) {
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
            }, suggestionsBuilder:
                    (BuildContext context, SearchController controller) {
              return List<ListTile>.generate(5, (int index) {
                final String item = 'item $index';
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    setState(() {
                      controller.closeView(item);
                    });
                  },
                );
              });
            }),
          ),
          HomeContent(cate: 'Thực vật'),
          HomeContent(cate: 'Food'),
          HomeContent(cate: 'Drink'),
          
          
          

          
         
         
          ]
        ),
      ),
    );
  }

  
}
