class Company {
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
  int? businessRadius;
  String? createdOn;
  CompanyLinks? links;

  Company({
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
    this.businessRadius,
    this.createdOn,
    this.links,
  });

  // We are taking the id property out of the json and assigning
  // it to the instance variable that we created from our model.
  factory Company.fromJson(Map<String, dynamic> parsedJson) {
    return Company(
      companyId: parsedJson['id'] ?? 0,
      logoFile: parsedJson['logo_file'] ?? '',
      name: parsedJson['name'] ?? '',
      building: parsedJson['building'] ?? '',
      block: parsedJson['block'] ?? '',
      street: parsedJson['street'] ?? '',
      floorNum: parsedJson['floor_num'] ?? '',
      unitNum: parsedJson['unit_num'] ?? '',
      city: parsedJson['city'] ?? '',
      state: parsedJson['state'] ?? '',
      countryName: parsedJson['country'] ?? '',
      postalCode: parsedJson['postal_code'] ?? '',
      lat: parsedJson['lat'] ?? '',
      lon: parsedJson['lon'] ?? '',
      businessRadius: parsedJson['business_radius'] ?? '',
      createdOn: parsedJson['createdOn'] ?? '',
      links: CompanyLinks.fromJson(parsedJson['_links']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': companyId,
      'logo_file': logoFile,
      'name': name,
      'building': building,
      'block': block,
      'street': street,
      'floor_num': floorNum,
      'unit_num': unitNum,
      'city': city,
      'state': state,
      'country': countryName,
      'postal_code': postalCode,
      'lat': lat,
      'lon': lon,
      'business_radius': businessRadius,
      'createdOn': createdOn,
    };
  }
}

/////////////////// Company Links Model ///////////////////
class CompanyLinks {
  String selfLink;
  String? productLink;
  String? logoFileLink;

  CompanyLinks({
    required this.selfLink,
    this.productLink,
    this.logoFileLink,
  });

  factory CompanyLinks.fromJson(dynamic parsedJson) {
    return CompanyLinks(
      selfLink: parsedJson['self'],
      productLink:
          parsedJson['logo_file'] == null ? '' : parsedJson['unit_num'],
      logoFileLink: parsedJson['cart'] == null ? '' : parsedJson['unit_num'],
    );
  }
}
