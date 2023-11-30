class MenuModel {
  final String name, description;
  final int price;

  MenuModel(
      {required this.name, required this.price, required this.description});

  MenuModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        description = json['description'],
        price = json['price'];
}
