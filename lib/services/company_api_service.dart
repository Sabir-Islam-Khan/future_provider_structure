import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:http/http.dart' as http;
import 'package:jaaba/models/booking_model.dart';

import '../models/company_model.dart';
import '../utils/environment_variables.dart';
import '../utils/api_endpoints.dart';

class CompanyApiService {
  //////////////////////////// GET fetchCompanyList ////////////////////////////
  Future<List<Company>> fetchCompanyList() async {
    final companyListURL = Uri.parse(ApiUrl.companyListURL);
    final response = await http.get(companyListURL, headers: <String, String>{
      'Authorization': 'Bearer ' + token,
    });
    debugPrint(
        'companyApiService fetchCompanyList() requestToken: $token \n\n');
    debugPrint(
        'companyApiService fetchCompanyList() responseStatus: ${response.statusCode} \n\n');
    debugPrint(
        'companyApiService fetchCompanyList() responseHeaders: ${response.headers} \n\n');
    debugPrint(
        'companyApiService fetchCompanyList() responseBody: ${response.body} \n\n');

    if (response.statusCode == 200) {
      final _companies = (jsonDecode(response.body))['items'] as List;
      debugPrint(
          'companyApiService fetchCompanyList() _companies: $_companies \n\n');

      List<Company> companyList = _companies
          .map<Company>((company) => Company.fromJson(company))
          .toList();
      debugPrint(
          'companyApiService fetchCompanyList() companyList: $companyList \n\n');

      return companyList;
    } else {
      throw Exception(
          'companyApiService fetchCompanyList() GET request failed: '
          'Error ${response.statusCode} \n \n');
    }
  }
}
