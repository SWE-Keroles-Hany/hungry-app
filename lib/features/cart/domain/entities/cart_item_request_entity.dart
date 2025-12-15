class CartItemRequestEntity {
  int productId;
  int quantity;
  double spicy;
  List<int> toppings;
  List<int> sideOptions;
  CartItemRequestEntity(
  { required this.productId,
   required this.quantity,
  required  this.sideOptions,
  required  this.spicy,
 required   this.toppings,}
  );
}
