import 'dart:async';

import '../models/product_model.dart';
import '../services/product_api_service.dart';

enum ProductActions { fetch, delete }

class ProductsBloc {
  final _stateStremController = StreamController<List<Product>>();
  StreamSink<List<Product>> get _productSink => _stateStremController.sink;
  Stream<List<Product>> get productStream => _stateStremController.stream;

  final _eventStreamController = StreamController<ProductActions>();

  StreamSink<ProductActions> get eventSink => _eventStreamController.sink;
  Stream<ProductActions> get _eventStream => _eventStreamController.stream;

  ProductsBloc() {
    _eventStream.listen((event) async {
      if (event == ProductActions.fetch) {
        try {
          var product = await ProductApiService().fetchProductList();
          _productSink.add(product);
        } on Exception catch (error) {
          _productSink.addError("Error adding product \n $error \n\n");
        }
      }
    });
  }
}
