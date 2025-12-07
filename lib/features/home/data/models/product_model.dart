class ProductModel {
  int? id;
  String? name;
  String? description;
  String? image;
  String? rating;
  String? price;

  ProductModel({
    this.id,
    this.name,
    this.description,
    this.image,
    this.rating,
    this.price,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    rating = json['rating'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['rating'] = rating;
    data['price'] = price;
    return data;
  }
}
