class OrderEntity {
  final int id;
  final String status;
  final String totalPrice;
  final String createdAt;
  final String productImage;

  OrderEntity({
    required this.id,
    required this.status,
    required this.totalPrice,
    required this.createdAt,
    required this.productImage,
  });
}
