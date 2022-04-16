class Promo {
  final int productId;
  final int companyId;
  final String featurePicture;
  final String brand;
  final String model;
  final String description;
  final String currency;
  final int amount;
  final String createdOn;
  final bool isOtc;
  final bool isPromo;
  final bool isPrescription;
  final bool isConsult;
  PromoLinks links;

  Promo({
    required this.productId,
    required this.companyId,
    required this.featurePicture,
    required this.brand,
    required this.model,
    required this.description,
    required this.currency,
    required this.amount,
    required this.createdOn,
    required this.isOtc,
    required this.isPromo,
    required this.isPrescription,
    required this.isConsult,
    required this.links,
  });

  // We are taking the id property out of the json and assigning
  // it to the instance variable that we created from our model.
  factory Promo.fromJson(Map<String, dynamic> parsedJson) {
    return Promo(
      productId: parsedJson['id'],
      companyId: parsedJson['company_id'],
      featurePicture: parsedJson['feature_picture'],
      brand: parsedJson['brand'],
      model: parsedJson['model'],
      description: parsedJson['description'],
      currency: parsedJson['currency'],
      amount: parsedJson['amount'],
      createdOn: parsedJson['created_on'],
      isOtc: parsedJson['is_otc'] ?? false,
      isConsult: parsedJson['is_consult'] ?? false,
      isPrescription: parsedJson['is_prescription'] ?? false,
      isPromo: parsedJson['is_promo'] ?? false,
      links: PromoLinks.fromJson(parsedJson['_links']),
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
      'currency': currency,
      'amount': amount,
      'created_on': createdOn,
    };
  }
}

/////////////////// Product Links Model ///////////////////
class PromoLinks {
  String selfLink;
  String supplierLink;
  String featurePictureLink;

  PromoLinks({
    required this.selfLink,
    required this.supplierLink,
    required this.featurePictureLink,
  });

  factory PromoLinks.fromJson(dynamic parsedJson) {
    return PromoLinks(
      selfLink: parsedJson['self'],
      supplierLink: parsedJson['supplier'],
      featurePictureLink: parsedJson['feature_picture'],
    );
  }
}
