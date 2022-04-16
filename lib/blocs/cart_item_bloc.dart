import 'dart:async';

import 'package:jaaba/models/cart_item_model.dart';
import 'package:jaaba/services/cart_api_service.dart';

enum CartItemActions { fetch, delete }

class CartItemBloc {
  final _stateStremController = StreamController<List<CartItem>>();
  StreamSink<List<CartItem>> get _cartItemSink => _stateStremController.sink;
  Stream<List<CartItem>> get cartItemStream => _stateStremController.stream;

  final _eventStreamController = StreamController<CartItemActions>();

  StreamSink<CartItemActions> get eventSink => _eventStreamController.sink;
  Stream<CartItemActions> get _eventStream => _eventStreamController.stream;

  CartItemBloc() {
    _eventStream.listen((event) async {
      if (event == CartItemActions.fetch) {
        try {
          var cartItem = await CartApiService().fetchCartItemList();
          _cartItemSink.add(cartItem);
        } on Exception catch (error) {
          _cartItemSink.addError("Error adding product \n $error \n\n");
        }
      }
    });
  }
}
