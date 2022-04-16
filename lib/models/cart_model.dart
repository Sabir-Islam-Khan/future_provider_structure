class Cart {
  final int cartId;
  final int userId;
  final int? cartItemsCount;
  final int? cartItemSubtotal;
  final int? deliverySubtotal;
  final int? taxSubtotal;
  final int? grandTotal;
  CartLinks links;

  Cart({
    required this.cartId,
    required this.userId,
    this.cartItemsCount,
    this.cartItemSubtotal,
    this.deliverySubtotal,
    this.taxSubtotal,
    this.grandTotal,
    required this.links,
  });

  // We are taking the id property out of the json and assigning
  // it to the instance variable that we created from our model.
  factory Cart.fromJson(Map<String, dynamic> parsedJson) {
    return Cart(
      cartId: parsedJson['id'],
      userId: parsedJson['user_id'],
      cartItemsCount: parsedJson['cart_items_count'] ?? 0,
      cartItemSubtotal: parsedJson['cart_item_subtotal'] ?? 0,
      deliverySubtotal: parsedJson['delivery_subtotal'] ?? 0,
      taxSubtotal: parsedJson['tax_subtotal'] ?? 0,
      grandTotal: parsedJson['grand_total'] ?? 0,
      links: CartLinks.fromJson(parsedJson['_links']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': cartId,
      'user_id': userId,
      'cart_items_count': cartItemsCount,
      'cart_item_subtotal': cartItemSubtotal,
      'delivery_subtotal': deliverySubtotal,
      'tax_subtotal': taxSubtotal,
      'grand_total': grandTotal,
    };
  }
}

/////////////////// Cart Links Model ///////////////////
class CartLinks {
  String selfLink;
  String? cartItems;
  String? deliveries;
  String? taxes;
  String owner;

  CartLinks({
    required this.selfLink,
    this.cartItems,
    this.deliveries,
    this.taxes,
    required this.owner,
  });

  factory CartLinks.fromJson(dynamic parsedJson) {
    return CartLinks(
      selfLink: parsedJson['self'],
      cartItems: parsedJson['cart_items'] ?? '',
      deliveries: parsedJson['deliveries'] ?? '',
      taxes: parsedJson['taxes'] ?? '',
      owner: parsedJson['owner'],
    );
  }
}
