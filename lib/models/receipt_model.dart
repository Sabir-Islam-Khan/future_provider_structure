class Receipt {
  final int receiptId;
  final int customerId;
  final int transactionId;
  final String cartItemsCount;
  final String cartItemSubtotal;
  final String deliverySubtotal;
  final String taxSubtotal;
  final String grandTotal;
  final String createdOn;
  ReceiptLinks links;

  Receipt({
    required this.receiptId,
    required this.customerId,
    required this.transactionId,
    required this.cartItemsCount,
    required this.cartItemSubtotal,
    required this.deliverySubtotal,
    required this.taxSubtotal,
    required this.grandTotal,
    required this.createdOn,
    required this.links,
  });

  // We are taking the id property out of the json and assigning
  // it to the instance variable that we created from our model.
  factory Receipt.fromJson(Map<String, dynamic> parsedJson) {
    return Receipt(
      receiptId: parsedJson['id'],
      customerId: parsedJson['customer_id'],
      transactionId: parsedJson['transaction_id'],
      cartItemsCount: parsedJson['cart_items_count'],
      cartItemSubtotal: parsedJson['cart_item_subtotal'],
      deliverySubtotal: parsedJson['delivery_subtotal'],
      taxSubtotal: parsedJson['tax_subtotal'],
      grandTotal: parsedJson['grand_total'],
      createdOn: parsedJson['created_on'],
      links: ReceiptLinks.fromJson(parsedJson['_links']),
    );
  }

  Map<String, dynamic> toJson() {
    return{
      'id': receiptId,
      'customer_id': customerId,
      'transaction_id': transactionId,
      'cart_items_count': cartItemsCount,
      'cart_item_subtotal': cartItemSubtotal,
      'delivery_subtotal': deliverySubtotal,
      'tax_subtotal': taxSubtotal,
      'grand_total': grandTotal,
      'created_on': createdOn,
    };
  }
}

/////////////////// Receipt Links Model ///////////////////
class ReceiptLinks {
  String selfLink;
  String cartItemsLink;
  String deliveriesLink;
  String taxesLink;

  ReceiptLinks({
    required this.selfLink,
    required this.cartItemsLink,
    required this.deliveriesLink,
    required this.taxesLink,
  });

  factory ReceiptLinks.fromJson(dynamic parsedJson) {
    return ReceiptLinks(
      selfLink: parsedJson['self'],
      cartItemsLink: parsedJson['cart_items'],
      deliveriesLink: parsedJson['deliveries'],
      taxesLink: parsedJson['taxes'],
    );
  }
}