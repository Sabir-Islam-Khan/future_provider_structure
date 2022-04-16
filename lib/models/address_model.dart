class Address {
  final int addressId;
  final int userId;
  final String building;
  final String block;
  final String street;
  final String floor;
  final String unit;
  final String city;
  final String state;
  final String country;
  final String postalCode;
  final String lat;
  final String lon;
  final String isActive;
  final String createdOn;
  AddressLinks links;

  Address({
    required this.addressId,
    required this.userId,
    required this.building,
    required this.block,
    required this.street,
    required this.floor,
    required this.unit,
    required this.city,
    required this.state,
    required this.country,
    required this.postalCode,
    required this.lat,
    required this.lon,
    required this.isActive,
    required this.createdOn,
    required this.links,
  });

  // We are taking the id property out of the json and assigning
  // it to the instance variable that we created from our model.
  factory Address.fromJson(Map<String, dynamic> parsedJson) {
    return Address(
      addressId: parsedJson['id'],
      userId: parsedJson['user_id'],
      building: parsedJson['building'],
      block: parsedJson['block'],
      street: parsedJson['street'],
      floor: parsedJson['floor'],
      unit: parsedJson['unit'],
      city: parsedJson['city'],
      state: parsedJson['state'],
      country: parsedJson['country'],
      postalCode: parsedJson['postal_code'],
      lat: parsedJson['lat'],
      lon: parsedJson['lon'],
      isActive: parsedJson['is_active'],
      createdOn: parsedJson['created_on'],
      links: AddressLinks.fromJson(parsedJson['_links']),
    );
  }

  Map<String, dynamic> toJson() {
    return{
      'id': addressId,
      'user_id': userId,
      'building': building,
      'block': block,
      'street': street,
      'floor': floor,
      'unit': unit,
      'city': city,
      'state': state,
      'country': country,
      'postal_ode': postalCode,
      'lat': lat,
      'lon': lon,
      'is_active': isActive,
      'created_on': createdOn,
    };
  }
}

/////////////////// Address Links Model ///////////////////
class AddressLinks {
  String selfLink;

  AddressLinks({
    required this.selfLink,
  });

  factory AddressLinks.fromJson(dynamic parsedJson) {
    return AddressLinks(
      selfLink: parsedJson['self'],
    );
  }
}