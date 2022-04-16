import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:jaaba/models/booking_model.dart';
import 'package:jaaba/models/cart_item_model.dart';
import 'package:jaaba/models/product_model.dart';
import 'package:jaaba/models/promo_model.dart';
import 'package:jaaba/models/suppliers_model.dart';
import 'package:jaaba/provider/product_quantity_provider.dart';
import 'package:jaaba/services/product_api_service.dart';
import 'package:provider/provider.dart';

import 'models/cart_model.dart';
import 'models/company_model.dart';
import 'models/user_model.dart';
import 'models/booking_model.dart';
import 'models/cart_model.dart';
import 'models/cart_item_model.dart';
import 'models/currency_model.dart';
import 'models/health_blog_model.dart';
import 'models/company_model.dart';
import 'models/product_model.dart';
import 'services/auth_api_service.dart';
import 'services/cart_api_service.dart';
import 'services/company_api_service.dart';
import 'services/user_api_service.dart';
import 'services/booking_api_service.dart';
import 'services/cart_api_service.dart';
import 'services/currency_api_service.dart';
import 'services/health_blog_api_service.dart';
import 'services/company_api_service.dart';
import 'services/product_api_service.dart';
import 'utils/environment_variables.dart';
import 'utils/themes.dart';
import 'screens/landing/landing_page.dart';
import 'screens/login/login_page.dart';
import 'screens/home/home_page.dart';
import 'screens/user/user_profile_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final _user = emptyUserList;
  final _cart = emptyCartList;
  // for FutureProvider initialData
  // Creating instance inside build method causes memory leak
  // and other undesirable effects.
  // The default constructor should be used to create values.
  runApp(
    Phoenix(
      child: MultiProvider(
        providers: [
          FutureProvider<User>(
            initialData: _user[0],
            create: (context) => UserApiService().fetchUser(),
          ),
          FutureProvider<List<HealthBlog>>(
            initialData: const [],
            create: (context) => HealthBlogApiService().fetchHealthBlogList(),
          ),
          FutureProvider<Cart>(
            initialData: _cart[0],
            create: (context) => CartApiService().fetchCart(),
          ),
          FutureProvider<List<CartItem>>(
            initialData: const [],
            create: (context) => CartApiService().fetchCartItemList(),
          ),
          FutureProvider<List<Company>>(
            initialData: const [],
            create: (context) => CompanyApiService().fetchCompanyList(),
          ),
          FutureProvider<List<Currency>>(
            initialData: const [],
            create: (context) => CurrencyApiService().fetchCurrencyList(),
          ),
          FutureProvider<List<Booking>>(
            initialData: const [],
            create: (context) => BookingApiService().fetchBookingList(),
          ),
          FutureProvider<List<Product>>(
            initialData: const [],
            create: (context) => ProductApiService().fetchProductList(),
          ),
          FutureProvider<List<Supplier>>(
            initialData: const [],
            create: (context) => CartApiService().fetchSuppliers(),
          ),
          // FutureProvider<List<Promo>>(
          //   initialData: const [],
          //   create: (context) => ProductApiService().fetchPromoList(),
          // ),
          ChangeNotifierProvider.value(
            value: ProductQuantityProvider(),
          )
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jaaba',
      theme: theme,
      home: FutureBuilder(
        future: AuthApiService().isUserLoggedIn(),
        builder: (context, isLoggedIn) {
          if (isLoggedIn == true) {
            return const HomePage();
          } else {
            AuthApiService().userAutoLogin(context);
            return const LandingPage();
          }
        },
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/loginPage': (context) => const LoginPage(),
        '/userProfilePge': (context) => const UserProfilePage(),
      },
    );
  }
}
