class ApiUrl {
  static const String baseURL = 'https://www.shrink.sg';
  static const String loginURL = baseURL + '/api/tokens';
  static const String registrationURL = baseURL + '/api/users';
  static const String forgotPasswordURL =
      baseURL + 'auth/requesting_new_password';

  // currencyListURL is the complete URL that fetches currencyList in DB
  static const String currencyListURL = baseURL + '/api/currencies';
  // partial links to be completed by currencyId
  static const String currencyLink = baseURL + '/api/currencies/';

  // userLink is the partial link that fetches user by userId
  static const String userLink = baseURL + '/api/users/';
  static const String userSelfieLink = baseURL + '/static/uploads/selfie_img/';
  static const String createUserLink = baseURL + '/api/users/create';
  static const String updateUserLink = baseURL + '/api/users/update/';
  static const String userBookingListLink = baseURL + '/api/users/bookings/';
  static const String userOrderListLink = baseURL + '/api/users/orders/';
  static const String userReceiptListLink = baseURL + '/api/users/receipts/';
  static const String userMedicalCertListLink =
      baseURL + '/api/users/medical_certs/';
  static const String userCurrencyLink = baseURL + '/api/users/currency/';

  // partial links to be completed by userId
  static const String cartLink = baseURL + '/api/carts/';
  static const String cartDeliveryLink = baseURL + '/api/carts/deliveries/';
  static const String cartTaxLink = baseURL + '/api/carts/taxes/';
  static const String cartSupplierLink = baseURL + '/api/carts/deliveries/';

  // partial links to be completed by userId
  static const String cartItemLink = baseURL + '/api/carts/cart_items/';
  static const String cartItemRemoveLink =
      baseURL + '/api/carts/cart_items/remove_item/';
  static const String incrementCartItemQtyLink =
      baseURL + '/api/carts/cart_items/increment_qty/';
  static const String decrementCartItemQtyLink =
      baseURL + '/api/carts/cart_items/decrement_qty/';
  static const String cartItemUpdateQuantityLink =
      baseURL + '/api/carts/cart_items/update_quantity/';

  // healthBlogListURL is the complete URL that fetches postList in DB
  static const String healthBlogListURL = baseURL + '/api/posts';
  static const String healthBlogPictoLink =
      baseURL + '/static/uploads/post_img/';

  // companyListURL is the complete URL that fetches companyList in DB
  static const String companyListURL = baseURL + '/api/companies';

  // partial links to be completed by companyId
  static const String companyLogoFileLink =
      baseURL + '/static/uploads/logo_img/';
  static const String createBookingLink = baseURL + '/api/bookings';
// partial links to be completed by bookingId
  static const String cancelBookingLink = baseURL + '/api/bookings/delete/';

  // productListURL is the complete URL that fetches productList in DB
  static const String productListURL = baseURL + '/api/products';
  // partial links to be completed by productId
  static const String productLink = baseURL + '/api/products/';
  static const String productPictureLink =
      baseURL + '/static/uploads/product_img/';
  static const String addProductToCartLink =
      baseURL + '/api/products/add_item/';
  static const String companyConsultProductLink =
      baseURL + '/api/companies/consult_products/';

  static const String cartItemSuppliersLink = baseURL + 'api/carts/deliveries/';
}

// Call as Uri.parse(userLink + userID.toString() + '/upload_selfie')