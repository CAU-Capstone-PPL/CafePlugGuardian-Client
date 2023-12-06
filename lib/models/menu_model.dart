class MenuModel {
  final String name, description;
  final int? id;
  final int price;

  MenuModel(
      {this.id,
      required this.name,
      required this.price,
      required this.description});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'description': description,
    };
  }

  MenuModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        price = json['price'];
}
