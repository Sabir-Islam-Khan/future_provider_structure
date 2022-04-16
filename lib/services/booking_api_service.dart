import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../models/booking_model.dart';
import '../utils/environment_variables.dart';
import '../utils/api_endpoints.dart';
import '../screens/home/home_page.dart';

class BookingApiService {
  //////////////////////////// GET fetchBookingList ////////////////////////////
  Future<List<Booking>> fetchBookingList() async {
    final bookingListURL = Uri.parse(
      ApiUrl.userBookingListLink + userId.toString(),
    );
    final response = await http.get(
      bookingListURL,
      headers: <String, String>{
        'Authorization': 'Bearer ' + token,
      },
    );
    debugPrint(
        "bookingListApiService fetchBookingList() requestToken: $token \n\n");
    debugPrint(
        "bookingListApiService fetchBookingList() responseStatus: ${response.statusCode} \n\n");
    debugPrint(
        "bookingListApiService fetchBookingList() responseHeaders: ${response.headers} \n\n");
    debugPrint(
        "bookingListApiService fetchBookingList() responseBody: ${response.body} \n\n");

    if (response.statusCode == 200) {
      final _bookings = (jsonDecode(response.body))['items'] as List;
      debugPrint(
          'bookingListApiService fetchBookingList() _bookings: $_bookings \n\n');

      List<Booking> bookingList = _bookings
          .map<Booking>((booking) => Booking.fromJson(booking))
          .toList();
      debugPrint(
          'bookingListApiService fetchBookingList() bookingList: $bookingList \n\n');

      return bookingList;
    } else {
      throw Exception(
          'bookingListApiService fetchBookingList() GET request failed: '
          'Error ${response.statusCode} \n \n ');
    }
  }

  ///////////////////////// get consultation product details /////////////////////
  ///

  Future<int> getConsultProduct(int companyId) async {
    final consultUrl =
        Uri.parse(ApiUrl.companyConsultProductLink + companyId.toString());

    debugPrint("consult url is    \n\n $consultUrl \n\n");

    final response = await http.get(
      consultUrl,
      headers: <String, String>{
        'Authorization': 'Bearer ' + token,
      },
    );

    if (response.statusCode == 200) {
      debugPrint("success in getting consultation details");

      Map<String, dynamic> responseJson = json.decode(response.body);

      return responseJson['items'][0]['id'];
    } else {
      throw Exception(
          "Error in fetching consult product .. Error code ${response.statusCode}");
    }
  }

  //////////////////////////// POST createBooking ////////////////////////////
  Future<Map<String, dynamic>> createBooking(
      BuildContext context, int companyId, String note) async {
    final consultId = await getConsultProduct(companyId);

    debugPrint("consult id is ====== \n  $consultId  \n\n ");

    final createBookingURL = Uri.parse(ApiUrl.createBookingLink);
    final response = await http.post(
      createBookingURL,
      headers: <String, String>{
        'Authorization': 'Bearer ' + token,
      },
      body: json.encode(
        {
          'product_id': consultId,
          'note': note,
        },
      ),
    );
    debugPrint('BookingApiService createBooking() requestToken: $token \n\n');
    debugPrint(
        'BookingApiService createBooking() responseStatus: ${response.statusCode} \n\n');
    debugPrint(
        'BookingApiService createBooking() responseHeaders: ${response.headers} \n\n');
    debugPrint(
        'BookingApiService createBooking() responseBody: ${response.body} \n\n');

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      debugPrint(
          'BookingApiService createBooking() POST request jsonData: $jsonData \n\n');

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
        (Route<dynamic> route) => false,
      );

      return jsonData;
    } else {
      throw Exception('BookingApiService createBooking() POST request failed: '
          'Error ${response.statusCode}');
    }
  }

  //////////////////////// DELETE cancelBooking ////////////////////////
  void deleteBooking(BuildContext context, int companyId) async {
    final consultId = await getConsultProduct(companyId);
    final cancelBookingURL =
        Uri.parse(ApiUrl.cancelBookingLink + consultId.toString());
    final response = await http.delete(
      cancelBookingURL,
      headers: <String, String>{
        'Authorization': 'Bearer ' + token,
      },
    );

    if (response.statusCode == 200) {
      debugPrint('Booking $companyId deleted');
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
        (Route<dynamic> route) => false,
      );
    } else {
      throw Exception(
          'BookingApiService createBooking() DELETE request failed: '
          'Error ${response.statusCode} \n\n');
    }
  }
}
