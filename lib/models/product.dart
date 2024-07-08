class Product{
  final String id;
   String name;
   String category;
   String image;
   int price;
   Product({
    required this.id,
    required this.name,
    required this.category,
    required this.image,
    required this.price,
   });
    

   
   String getID()=>this.id;
   String getName()=>this.name;
   void setName(String name){this.name=name;}
   String getCategory()=>this.category;
   void setCategory(String category){this.category=category;}
   String getImage()=>this.image;
   void setImage(String image){this.image=image;}
   int getPrice()=>this.price;
   void setPrice(int price){this.price=price;}
   
  Map<String, dynamic> toMap()=>{"id":id, "name":name,"category":category,"image":image, "price":price};
}