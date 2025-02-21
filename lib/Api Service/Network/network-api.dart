import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../api_service.dart';


class NetworkApiServices extends BaseApiServices {
  dynamic responseJson;

  @override
  Future getGetApiResponse({
    required String url,
    dynamic headers,
    required BuildContext context,
  }) async {
    try {
      final response = await http
          .get(Uri.parse(url), headers: headers)
          .timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException {
      // throw FetchDataException("No Internet Connection");
      // NoInternetPopup.show(context!);
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw SnackBar(content: Text('Error occurred: ${response.statusCode}'));
      case 401:
        return jsonDecode(response.body);
      default:
        throw SnackBar(content: Text('Error occurred: ${response.statusCode}'));
    }
  }

  @override
  Future getPostApiResponse({required String url, request, headers,BuildContext? context,}) async {
    try {
      final response = await http
          .post(
        Uri.parse(url),
        body: request,
        headers: headers,
        encoding: Encoding.getByName("utf-8"),
      ).timeout(const Duration(seconds: 20));
      responseJson = returnResponse(
        response,
      );
    } on SocketException {
      // throw FetchDataException("No Internet Connection");
      // NoInternetPopup.show(context!);
    }
    return responseJson;
  }
}