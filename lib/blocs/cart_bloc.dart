// import 'dart:async';

// import 'package:jaaba/services/cart_api_service.dart';
// import 'package:jaaba/services/user_cart_service.dart';

// import '../models/cart_model.dart';

// enum CartActions { fetch, delete }

// class CartBloc {
//   final _stateStremController = StreamController<List<Cart>>();
//   StreamSink<List<Cart>> get _cartSink => _stateStremController.sink;
//   Stream<List<Cart>> get cartStream => _stateStremController.stream;

//   final _eventStreamController = StreamController<CartActions>();

//   StreamSink<CartActions> get eventSink => _eventStreamController.sink;
//   Stream<CartActions> get _eventStream => _eventStreamController.stream;

//   CartBloc() {
//     _eventStream.listen((event) async {
//       if (event == CartActions.fetch) {
//         try {
//           var cart = await CartApiService().fetchCart();
//           _cartSink.add(cart);
//         } on Exception catch (error) {
//           _cartSink.addError("Error adding product \n $error \n\n");
//         }
//       }
//     });
//   }
// }
