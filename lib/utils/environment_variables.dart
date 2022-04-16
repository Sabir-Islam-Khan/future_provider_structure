import '../models/cart_model.dart';
import '../models/user_model.dart';
import '../models/cart_model.dart';
import '../models/cart_item_model.dart';

String autoLoginEncKey = 'TEST_32_BITS_KEY................'; // 32Bit
bool isLocationSet = false;
bool hasCompletedProfile = false;
bool hasDeliveryAddress = false;
bool startupFlag = true;

int userId = 0;
String token = '';
String selfie = '';
String userName = '';
String givenName = '';
String lastName = '';
String email = '';
String designation = '';
String phoneNum = '';
String cartLink = '';
String ordersLink = '';
String receiptsLink = '';
String selfLink = '';
String profilePicLink = '';
String sessionID = '';
String publicKey = '';
int cartID = 0;
double? userLat;
double? userLon;

final emptyUserList = [
  User(
    userId: 0,
    currencyId: 0,
    currencyName: '',
    deviceId: '',
    fcmToken: '',
    selfieFile: '',
    userName: '',
    email: '',
    designation: '',
    givenName: '',
    lastName: '',
    aboutMe: '',
    languages: '',
    allergies: '',
    preExisting: '',
    countryCode: '',
    phoneNum: '',
    idType: '',
    idReg: '',
    nationality: '',
    hasCompletedProfile: false,
    hasDeliveryAddress: false,
    lastSeen: '',
    links: UserLinks(
      selfLink: '',
      selfieFileLink: '',
      bookingsSentLink: '',
      currencyLink: '',
      cartLink: '',
      addressesLink: '',
      historyLink: '',
      ordersLink: '',
      receiptsLink: '',
      medicalCertsLink: '',
      likedPostsLink: '',
      likedProductsLink: '',
      likedBusinessesLink: '',
    ),
  ),
];

final emptyCartList = [
  Cart(
    cartId: 0,
    userId: 0,
    cartItemsCount: 0,
    cartItemSubtotal: 0,
    deliverySubtotal: 0,
    taxSubtotal: 0,
    grandTotal: 0,
    links: CartLinks(
      selfLink: '',
      owner: '',
    ),
  ),
];

final emptyCartItemList = [
  CartItem(
    cartItemId: 0,
    productId: 0,
    supplierId: 0,
    supplierName: '',
    cartId: 0,
    transactionId: 0,
    taxId: 0,
    orderId: 0,
    orderReceivedId: 0,
    receiptId: 0,
    brand: '',
    model: '',
    currency: '',
    amount: 0,
    discount: 0,
    quantity: 0,
    ttlAmount: 0,
    featurePicture: '',
    links: CartItemLinks(
      selfLink: '',
      featurePictureLink: '',
      supplierLink: '',
    ),
  ),
];

var userAddressGlobal;
int? userBookedClinicId;
List favouriteProductIdGlobal = [];
List favouriteClinicIdGlobal = [];
List promoListIdGlobal = [];
List favouritePostIdGlobal = [];
List cartSupplierNamesGlobal = [];

String mapboxURL =
    "https://api.mapbox.com/styles/v1/risingwind97/ckokwkxa20xrg19o1k9jskevr/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicmlzaW5nd2luZDk3IiwiYSI6ImNrb2t3ZTlxZjAwYzMyb3Myem9yeHN6d3YifQ.XjD5c3nckIRyiF3cypG0sA";

String mapBoxToken =
    "pk.eyJ1IjoicmlzaW5nd2luZDk3IiwiYSI6ImNrb2t3aWlxczA4ZnIydXBmZ2psdnk1czUifQ.OdMFtbHu4OpAk1Al-fj3rA";

String mapBoxID = "'mapbox.country-boundaries-v1'";
