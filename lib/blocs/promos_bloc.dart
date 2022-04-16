import 'dart:async';

import 'package:jaaba/models/promo_model.dart';

import '../services/product_api_service.dart';

enum PromoActions { fetch, delete }

class PromosBloc {
  final _stateStremController = StreamController<List<Promo>>();
  StreamSink<List<Promo>> get _promoSink => _stateStremController.sink;
  Stream<List<Promo>> get promoStream => _stateStremController.stream;

  final _eventStreamController = StreamController<PromoActions>();

  StreamSink<PromoActions> get eventSink => _eventStreamController.sink;
  Stream<PromoActions> get _eventStream => _eventStreamController.stream;

  // PromosBloc() {
  //   _eventStream.listen(
  //     (event) async {
  //       if (event == PromoActions.fetch) {
  //         try {
  //           var promo = await ProductApiService().fetchPromoList();
  //           _promoSink.add(promo);
  //         } on Exception catch (error) {
  //           _promoSink.addError("Error adding promo \n $error \n\n");
  //         }
  //       }
  //     },
  //   );
  // }
}
