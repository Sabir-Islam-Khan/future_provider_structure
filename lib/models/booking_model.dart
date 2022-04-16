class Booking {
  int? companyId;
  String? logoFile;
  String? name;
  String? building;
  String? block;
  String? street;
  String? floorNum;
  String? unitNum;
  String? city;
  String? state;
  String? countryName;
  String? postalCode;
  double? lat;
  double? lon;
  String? model;
  int? businessRadius;
  String? createdOn;
  BookingLinks? links;

  Booking({
    this.companyId,
    this.logoFile,
    this.name,
    this.building,
    this.block,
    this.street,
    this.floorNum,
    this.unitNum,
    this.city,
    this.state,
    this.countryName,
    this.postalCode,
    this.lat,
    this.lon,
    this.model,
    this.businessRadius,
    this.createdOn,
    this.links,
  });

  // We are taking the id property out of the json and assigning
  // it to the instance variable that we created from our model.
  factory Booking.fromJson(Map<String, dynamic> parsedJson) {
    return Booking(
      companyId: parsedJson['company_id'] ?? 0,
      logoFile: parsedJson['company_logo_file'] ?? '',
      name: parsedJson['company_name'] ?? '',
      building: parsedJson['company_building'] ?? '',
      block: parsedJson['company_block'] ?? '',
      street: parsedJson['company_street'] ?? '',
      floorNum: parsedJson['company_floor_num'] ?? '',
      unitNum: parsedJson['company_unit_num'] ?? '',
      city: parsedJson['company_city'] ?? '',
      state: parsedJson['company_state'] ?? '',
      countryName: parsedJson['company_country'] ?? '',
      postalCode: parsedJson['company_postal_code'] ?? '',
      lat: parsedJson['company_lat'],
      lon: parsedJson['company_lon'],
      model: parsedJson['product_model'],
      businessRadius: parsedJson['business_radius'],
      createdOn: parsedJson['timestamp'] ?? '',
      links: BookingLinks.fromJson(parsedJson['_links']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'company_id': companyId,
      'company_logo_file': logoFile,
      'company_name': name,
      'company_building': building,
      'company_block': block,
      'company_street': street,
      'company_floor_num': floorNum,
      'company_unit_num': unitNum,
      'company_city': city,
      'company_state': state,
      'compay_country': countryName,
      'company_postal_code': postalCode,
      'company_lat': lat,
      'company_lon': lon,
      'product_model': model,
      'business_radius': businessRadius,
      'timestamp': createdOn,
    };
  }
}

/////////////////// Company Links Model ///////////////////
class BookingLinks {
  String selfLink;
  String? productLink;
  String? logoFileLink;

  BookingLinks({
    required this.selfLink,
    this.productLink,
    this.logoFileLink,
  });

  factory BookingLinks.fromJson(dynamic parsedJson) {
    return BookingLinks(
      selfLink: parsedJson['self'] ?? "",
      productLink:
          parsedJson['logo_file'] == null ? '' : parsedJson['unit_num'],
      logoFileLink: parsedJson['cart'] == null ? '' : parsedJson['unit_num'],
    );
  }
}
