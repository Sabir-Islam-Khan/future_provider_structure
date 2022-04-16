class Supplier {
  final int? amount;
  final int? cartId;
  final String? currency;
  final int? customerId;
  final double? dropoffDistance;
  final int? id;
  final int? orderId;
  final int? supplierId;
  final String? supplierName;
  final int? transactionId;
  SupplierLinks links;

  Supplier(
      {required this.amount,
      required this.cartId,
      required this.currency,
      required this.customerId,
      required this.dropoffDistance,
      required this.id,
      required this.orderId,
      required this.supplierId,
      required this.supplierName,
      required this.transactionId,
      required this.links});

  // We are taking the id property out of the json and assigning
  // it to the instance variable that we created from our model.
  factory Supplier.fromJson(Map<String, dynamic> parsedJson) {
    return Supplier(
      amount: parsedJson['amount'],
      cartId: parsedJson['cart_id'],
      currency: parsedJson['currency'],
      customerId: parsedJson['customer_id'],
      dropoffDistance: parsedJson['dropoff_dist'],
      id: parsedJson['id'],
      orderId: parsedJson['order_id'],
      supplierId: parsedJson['supplier_id'],
      supplierName: parsedJson['supplier_name'],
      transactionId: parsedJson['transaction_id'],
      links: SupplierLinks.fromJson(
        parsedJson['_links'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'cart_id': cartId,
      'currency': currency,
      'customer_id': customerId,
      'dropoff_dist': dropoffDistance,
      'id': id,
      'order_id': orderId,
      'supplier_id': supplierId,
      'supplier_name': supplierName,
      'transaction_id': transactionId,
    };
  }
}

/////////////////// Cart Links Model ///////////////////
class SupplierLinks {
  String selfLink;

  SupplierLinks({
    required this.selfLink,
  });

  factory SupplierLinks.fromJson(dynamic parsedJson) {
    return SupplierLinks(
      selfLink: parsedJson['self'] ?? "",
    );
  }
}
