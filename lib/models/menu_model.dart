class MenuModel {
  final String menuName, menuDescription;
  final int menuId;
  final int menuPrice;

  MenuModel(
      {required this.menuId,
      required this.menuName,
      required this.menuPrice,
      required this.menuDescription});

  Map<String, dynamic> toJson() {
    return {
      'menuName': menuName,
      'price': menuPrice,
      'description': menuDescription,
    };
  }

  MenuModel.fromJson(Map<String, dynamic> json)
      : menuId = json['menuId'],
        menuName = json['menuName'],
        menuDescription = json['menuDescription'],
        menuPrice = json['menuPrice'];
}
