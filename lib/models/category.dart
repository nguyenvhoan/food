class Category{
  final String idCate;
  String nameCate;
  String descript;
  String img;
  Category({required this.idCate,required this.nameCate, required this.descript, required this.img});
  
  getIDCate()=>this.idCate;
  getName()=>this.nameCate;
  setName(String name){this.nameCate=name;}
  Map<String,dynamic> toMap()=>{"idCate":idCate,"nameCate":nameCate ,"des":descript,"img":img};
}