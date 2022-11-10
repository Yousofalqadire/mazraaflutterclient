
class CategoryEntity {
  final int categoryID;
  final String categoryName;

  CategoryEntity({required this.categoryID, required this.categoryName});

  factory CategoryEntity.fromJson(Map<String,dynamic> json){
    return CategoryEntity(categoryID: json['categoryID'], categoryName: json['categoryName']);

  }

  @override
  String toString() {
    return '{categoryID : $categoryID , categoryName : $categoryName }';
  }


}