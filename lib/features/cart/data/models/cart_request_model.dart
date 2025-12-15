class CartItemRequestModel {
  int productId;
  int quantity;
  double spicy;
  List<int> toppings;
  List<int> sideOptions;
  CartItemRequestModel(
    this.productId,
    this.quantity,
    this.sideOptions,
    this.spicy,
    this.toppings,
  );
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
      'spicy': spicy,
      'toppings': toppings,
      'sideOptions': sideOptions,
    };
  }
}
