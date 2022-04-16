import '../utils/api_endpoints.dart';
import '../utils/environment_variables.dart';

class CartItem {
  final int cartItemId;
  final int productId;
  final int supplierId;
  final String supplierName;
  final int? cartId;
  final int transactionId;
  final int? taxId;
  final int? orderId;
  final int? orderReceivedId;
  final int? receiptId;
  final String? brand;
  final String? model;
  final String currency;
  final int amount;
  final int? discount;
  final int quantity;
  final int ttlAmount;
  final String? featurePicture;
  CartItemLinks? links;

  CartItem({
    required this.cartItemId,
    required this.productId,
    required this.supplierId,
    required this.supplierName,
    this.cartId,
    required this.transactionId,
    required this.taxId,
    this.orderId,
    this.orderReceivedId,
    this.receiptId,
    this.brand,
    this.model,
    required this.currency,
    required this.amount,
    this.discount,
    required this.quantity,
    required this.ttlAmount,
    this.featurePicture,
    this.links,
  });

  // We are taking the id property out of the json and assigning
  // it to the instance variable that we created from our model.
  factory CartItem.fromJson(Map<String, dynamic> parsedJson) {
    return CartItem(
      cartItemId: parsedJson['id'],
      productId: parsedJson['product_id'],
      supplierId: parsedJson['supplier_id'],
      supplierName: parsedJson['supplier_name'],
      cartId: parsedJson['cart_id'] ?? 0,
      transactionId: parsedJson['transaction_id'],
      taxId: parsedJson['tax_id'],
      orderId: parsedJson['order_id'] ?? 0,
      orderReceivedId: parsedJson['order_received_id'] ?? 0,
      receiptId: parsedJson['receipt_id'] ?? 0,
      brand: parsedJson['brand'] ?? '',
      model: parsedJson['model'] ?? '',
      currency: parsedJson['currency'],
      amount: parsedJson['amount'],
      discount: parsedJson['discount'] ?? 0,
      quantity: parsedJson['quantity'],
      ttlAmount: parsedJson['ttl_amount'],
      featurePicture: parsedJson['feature_picture'] ??
          ApiUrl.productPictureLink + 'product_img.png',
      links: CartItemLinks.fromJson(parsedJson['_links']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': cartItemId,
      'product_id': productId,
      'supplier_id': supplierId,
      'supplier_name': supplierName,
      'cart_id': cartId,
      'transaction_id': transactionId,
      'tax_id': taxId,
      'order_id': orderId,
      'order_received_id': orderReceivedId,
      'receipt_id': receiptId,
      'brand': brand,
      'model': model,
      'currency': currency,
      'amount': amount,
      'discount': discount,
      'quantity': quantity,
      'ttl_amount': ttlAmount,
      'feature_picture': featurePicture,
    };
  }
}

/////////////////// CartItem Links Model ///////////////////
class CartItemLinks {
  String selfLink;
  String featurePictureLink;
  String supplierLink;

  CartItemLinks({
    required this.selfLink,
    required this.featurePictureLink,
    required this.supplierLink,
  });

  factory CartItemLinks.fromJson(dynamic parsedJson) {
    return CartItemLinks(
      selfLink: parsedJson['self'],
      featurePictureLink: parsedJson['feature_picture'],
      supplierLink: parsedJson['supplier'],
    );
  }
}
