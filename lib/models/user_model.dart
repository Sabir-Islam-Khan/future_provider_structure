class User {
  final int userId;
  final int currencyId;
  final String currencyName;
  final String deviceId;
  final String fcmToken;
  final String selfieFile;
  final String userName;
  final String email;
  final String designation;
  final String givenName;
  final String lastName;
  final String aboutMe;
  final String languages;
  final String allergies;
  final String preExisting;
  final String countryCode;
  final String phoneNum;
  final String idType;
  final String idReg;
  final String nationality;
  final bool hasCompletedProfile;
  final bool hasDeliveryAddress;
  final String lastSeen;
  UserLinks links;

  User({
    required this.userId,
    required this.currencyId,
    required this.currencyName,
    required this.deviceId,
    required this.fcmToken,
    required this.selfieFile,
    required this.userName,
    required this.email,
    required this.designation,
    required this.givenName,
    required this.lastName,
    required this.aboutMe,
    required this.languages,
    required this.allergies,
    required this.preExisting,
    required this.countryCode,
    required this.phoneNum,
    required this.idType,
    required this.idReg,
    required this.nationality,
    required this.hasCompletedProfile,
    required this.hasDeliveryAddress,
    required this.lastSeen,
    required this.links,
  });

  // We are taking the id property out of the json and assigning
  // it to the instance variable that we created from our model.
  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
      userId: parsedJson['id'],
      currencyId: parsedJson['currency_id'] ?? '',
      currencyName: parsedJson['currency'] ?? '',
      deviceId: parsedJson['device_id'] ?? '',
      fcmToken: parsedJson['fcm_token'] ?? '',
      selfieFile: parsedJson['selfie_file'] ?? '',
      userName: parsedJson['username'] ?? '',
      email: parsedJson['email'] ?? '',
      designation: parsedJson['designation'] ?? '',
      givenName: parsedJson['given_name'] ?? '',
      lastName: parsedJson['last_name'] ?? '',
      aboutMe: parsedJson['about_me'] ?? '',
      languages: parsedJson['languages'] ?? '',
      allergies: parsedJson['allergies'] ?? '',
      preExisting: parsedJson['pre_existing'] ?? '',
      countryCode: parsedJson['country_code'] ?? '',
      phoneNum: parsedJson['phone'] ?? '',
      idType: parsedJson['id_type'] ?? '',
      idReg: parsedJson['id_reg'] ?? '',
      nationality: parsedJson['nationality'] ?? '',
      hasCompletedProfile: parsedJson['has_completed_profile'] ?? false,
      hasDeliveryAddress: parsedJson['has_delivery_address'] ?? false,
      lastSeen: parsedJson['last_seen'] ?? '',
      links: UserLinks.fromJson(parsedJson['_links']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': userId,
      'username': userName,
      'currency': currencyName,
      'email': email,
      'designation': designation,
      'given_name': givenName,
      'last_name': lastName,
      'languages': languages,
      'allergies': allergies,
      'pre_existing': preExisting,
      'country_code': countryCode,
      'phone': phoneNum,
      'id_type': idType,
      'id_reg': idReg,
      'nationality': nationality,
    };
  }
}

/////////////////// User Links Model ///////////////////
class UserLinks {
  String selfLink;
  String? bookingsSentLink;
  String? currencyLink;
  String? ordersLink;
  String? addressesLink;
  String? likedPostsLink;
  String? likedProductsLink;
  String? likedBusinessesLink;
  String? selfieFileLink;
  String? cartLink;
  String? historyLink;
  String? receiptsLink;
  String? medicalCertsLink;

  UserLinks({
    required this.selfLink,
    this.bookingsSentLink,
    this.currencyLink,
    this.ordersLink,
    this.addressesLink,
    this.likedPostsLink,
    this.likedProductsLink,
    this.likedBusinessesLink,
    this.selfieFileLink,
    this.cartLink,
    this.historyLink,
    this.receiptsLink,
    this.medicalCertsLink,
  });

  factory UserLinks.fromJson(dynamic parsedJson) {
    return UserLinks(
      selfLink: parsedJson['self'],
      bookingsSentLink: parsedJson['bookings_sent'] ?? '',
      currencyLink: parsedJson['currency'] ?? '',
      ordersLink: parsedJson['orders'] ?? '',
      addressesLink: parsedJson['addresses'] ?? '',
      likedPostsLink: parsedJson['liked_posts'] ?? '',
      likedProductsLink: parsedJson['liked_products'] ?? '',
      likedBusinessesLink: parsedJson['liked_businesses'] ?? '',
      selfieFileLink: parsedJson['selfie_file'] ?? '',
      cartLink: parsedJson['cart'] ?? '',
      historyLink: parsedJson['history'] ?? '',
      receiptsLink: parsedJson['receipts'] ?? '',
      medicalCertsLink: parsedJson['medical_certs'] ?? '',
    );
  }
}
