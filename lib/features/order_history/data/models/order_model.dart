class OrderModel {
  final int id;
  final String status;
  final String totalPrice;
  final String createdAt;
  final String productImage;

  OrderModel({
    required this.id,
    required this.status,
    required this.totalPrice,
    required this.createdAt,
    required this.productImage,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      status: json['status'],
      totalPrice: json['total_price'],
      createdAt: json['created_at'],
      productImage: json['product_image'],
    );
  }
}
