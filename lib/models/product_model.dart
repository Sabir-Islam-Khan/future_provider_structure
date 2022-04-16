// we are not extending ChangeNotifier here because a product is just a single
// object and we want to manage the state with something bigger than an object.

import '../utils/api_endpoints.dart';

class Product {
  final int productId;
  final int companyId;
  final String? featurePicture;
  final String? brand;
  final String? model;
  final String? description;
  final String? currencyName;
  final int? amount;
  final bool isOtc;
  final bool isPromo;
  final bool isPrescription;
  final bool isConsult;
  final String createdOn;
  ProductLinks links;

  Product({
    required this.productId,
    required this.companyId,
    this.featurePicture,
    this.brand,
    this.model,
    this.description,
    this.currencyName,
    this.amount,
    required this.isOtc,
    required this.isPromo,
    required this.isPrescription,
    required this.isConsult,
    required this.createdOn,
    required this.links,
  });

  // We are taking the id property out of the json and assigning
  // it to the instance variable that we created from our model.
  factory Product.fromJson(Map<String, dynamic> parsedJson) {
    return Product(
      productId: parsedJson['id'],
      companyId: parsedJson['company_id'],
      featurePicture: parsedJson['feature_picture'] ??
          ApiUrl.productPictureLink + 'product_img.png',
      brand: parsedJson['brand'] ?? '',
      model: parsedJson['model'] ?? '',
      description: parsedJson['description'] ?? '',
      currencyName: parsedJson['currency'] ?? '',
      amount: parsedJson['amount'] ?? 0,
      isOtc: parsedJson['is_otc;'] ?? false,
      isPromo: parsedJson['is_promo;'] ?? false,
      isPrescription: parsedJson['is_prescription;'] ?? false,
      isConsult: parsedJson['is_consult;'] ?? false,
      createdOn: parsedJson['created_on'],
      links: ProductLinks.fromJson(parsedJson['_links']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': productId,
      'company_id': companyId,
      'feature_picture': featurePicture,
      'brand': brand,
      'model': model,
      'description': description,
      'currency': currencyName,
      'amount': amount,
      'is_otc': isOtc,
      'is_promo': isPromo,
      'is_prescription': isPrescription,
      'is_consult': isConsult,
      'created_on': createdOn,
    };
  }
}

/////////////////// Product Links Model ///////////////////
class ProductLinks {
  String selfLink;
  String supplierLink;
  String featurePictureLink;

  ProductLinks({
    required this.selfLink,
    required this.supplierLink,
    required this.featurePictureLink,
  });

  factory ProductLinks.fromJson(dynamic parsedJson) {
    return ProductLinks(
      selfLink: parsedJson['self'],
      supplierLink: parsedJson['supplier'],
      featurePictureLink: parsedJson['feature_picture'],
    );
  }
}
