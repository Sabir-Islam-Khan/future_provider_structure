import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/currency_model.dart';
import '../utils/environment_variables.dart';
import '../utils/api_endpoints.dart';

class CurrencyApiService {
  //////////////////////////// GET currencyList ////////////////////////////
  Future<List<Currency>> fetchCurrencyList() async {
    final currencyListURL = Uri.parse(ApiUrl.currencyListURL);
    final response = await http.get(
        currencyListURL,
        headers: <String, String>{'Authorization': 'Bearer ' + token,
        }
    );
    debugPrint('currencyApiService requestToken: $token \n\n');
    debugPrint('currencyApiService responseStatus: ${response.statusCode} \n\n');
    debugPrint('currencyApiService responseHeaders: ${response.headers} \n\n');
    debugPrint('currencyApiService responseBody: ${response.body} \n\n');

    if (response.statusCode == 200) {
      final _currencies = await (jsonDecode(response.body))['items'] as List;
      debugPrint('currencyApiService _currencies: $_currencies \n\n');
      // List currency
      List<Currency> currencyList = _currencies.map<Currency>((currency) => Currency.fromJson(currency)).toList();
      debugPrint('currencyApiService currencyList: $currencyList \n\n');

      return currencyList;
    } else {
      throw Exception ('Failed to fetch currency');
    }
  }

  /////////////////////////// GET currencyNameList ///////////////////////////
  Future<List<String>> fetchCurrencyNameList() async {
    final currencyNameListURL = Uri.parse(ApiUrl.currencyListURL);
    final response = await http.get(
        currencyNameListURL,
        headers: <String, String>{'Authorization': 'Bearer ' + token,
        }
    );
    debugPrint("currencyApiService requestToken: $token \n\n");
    debugPrint("currencyApiService responseStatus: ${response.statusCode} \n\n");
    debugPrint("currencyApiService responseHeaders: ${response.headers} \n\n");
    debugPrint("currencyApiService responseBody: ${response.body} \n\n");

    if (response.statusCode == 200) {
      final _currencies = await (jsonDecode(response.body))['items'] as List;
      debugPrint('currencyApiService _currencies: $_currencies \n\n');
      // List currency
      List<Currency> currencyList = _currencies.map<Currency>((currency) => Currency.fromJson(currency)).toList();
      debugPrint('currencyApiService currencyList: $currencyList \n\n');
      // List currency.name
      List<String> currencyNameList = currencyList.map((currency) => currency.name).toList();
      debugPrint('currencyApiService currencyNameList: $currencyNameList \n\n');

      return currencyNameList;
    } else {
      throw Exception ('Failed to fetch currency');
    }
  }
}