class Order {
  final int orderId;
  final int buyerId;
  final String createdOn;
  OrderLinks links;

  Order({
    required this.orderId,
    required this.buyerId,
    required this.createdOn,
    required this.links,
  });

  // We are taking the id property out of the json and assigning
  // it to the instance variable that we created from our model.
  factory Order.fromJson(Map<String, dynamic> parsedJson) {
    return Order(
      orderId: parsedJson['id'],
      buyerId: parsedJson['buyer_id'],
      createdOn: parsedJson['created_on'],
      links: OrderLinks.fromJson(parsedJson['_links']),
    );
  }

  Map<String, dynamic> toJson() {
    return{
      'id': orderId,
      'buyer_id': buyerId,
      'created_on': createdOn,
    };
  }
}

/////////////////// Order Links Model ///////////////////
class OrderLinks {
  String selfLink;
  String cartItemsLink;

  OrderLinks({
    required this.selfLink,
    required this.cartItemsLink,
  });

  factory OrderLinks.fromJson(dynamic parsedJson) {
    return OrderLinks(
      selfLink: parsedJson['self'],
      cartItemsLink: parsedJson['cartItems_link'],
    );
  }
}