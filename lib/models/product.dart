class Product{
  final String id;
  final String name;
  final String category;
  final String image;
  final int price;
   Product({
    required this.id,
    required this.name,
    required this.category,
    required this.image,
    required this.price,
   });
  Map<String, dynamic> toMap()=>{"id":id, "name":name,"category":category, "price":price};
}