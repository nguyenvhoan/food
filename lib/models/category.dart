class Category{
  final String idCate;
  String nameCate;
  Category({required this.idCate,required this.nameCate});
  getIDCate()=>this.idCate;
  getName()=>this.nameCate;
  setName(String name){this.nameCate=name;}
  Map<String,dynamic> toMap()=>{"idCate":idCate,"nameCate":nameCate};
}