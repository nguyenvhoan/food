class Product{
  final String id;
   String name;
   String category;
   String image;
   int price;
   String des;
   Product({
    required this.id,
    required this.name,
    required this.category,
    required this.image,
    required this.price,
    required this.des,
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
   
  Map<String, dynamic> toMap()=>{"id":id, "name":name,"category":category,"image":image, "price":price, "des":des};
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      category: map['category'],
      image: map['image'],
      des: map['des'],
    );
  }
}