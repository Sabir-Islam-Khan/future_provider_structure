import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/health_blog_model.dart';
import '../utils/environment_variables.dart';
import '../utils/api_endpoints.dart';

class HealthBlogApiService {
  //////////////////////////// GET HealthBlogList ////////////////////////////
  Future<List<HealthBlog>> fetchHealthBlogList() async {
    final healthBlogListURL = Uri.parse(ApiUrl.healthBlogListURL);
    final response = await http.get(
        healthBlogListURL,
        headers: <String, String>{'Authorization': 'Bearer ' + token,
      }
    );
    debugPrint("healthBlogApiService requestToken: $token \n\n");
    debugPrint("healthBlogApiService responseStatus: ${response.statusCode} \n\n");
    debugPrint("healthBlogApiService responseHeaders: ${response.headers} \n\n");
    debugPrint("healthBlogApiService responseBody: ${response.body} \n\n");

    if (response.statusCode == 200) {
      final _blogs = (jsonDecode(response.body))['items'] as List;
      debugPrint('healthBlogApiService _blogs: $_blogs \n\n');

      List<HealthBlog> blogList = _blogs.map<HealthBlog>((blog) => HealthBlog.fromJson(blog)).toList();
      debugPrint('healthBlogApiService blogList: $blogList \n\n');

      return blogList;
    } else {
      throw Exception('Failed to blogs');
    }
  }
}