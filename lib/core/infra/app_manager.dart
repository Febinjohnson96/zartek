import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zartek/core/infra/app_exceptions.dart';

class ApiBaseHelper {
  final String _baseUrl = "faheemkodi.github.io";

  final Map<String, String> _headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  final Map<String, String> _base64Headers = {
    'content-type': 'application/text'
  };

  //http.Client client = http.Client();

  Future<dynamic> get(
      {required String endpoint,
      required Map<String, String> params,
      Map<String, String>? headers}) async {
    dynamic responseJson;
    try {
      var url = Uri.https(_baseUrl, endpoint, params);
      var response = await http.get(url, headers: headers ?? _headers);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw NoNetworkException();
    }
    return responseJson;
  }

  Future<dynamic> post(
      {required String endpoint,
      required Map<String, dynamic> params,
      Map<String, String>? headers}) async {
    dynamic responseJson;
    try {
      debugPrint(jsonEncode(params));
      var url = Uri.https(_baseUrl, endpoint);
      var response = await http.post(url,
          headers: headers ?? _headers, body: jsonEncode(params));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw NoNetworkException();
    }
    return responseJson;
  }

  Future<dynamic> postWithBody(
      {required String endpoint,
      required Map<String, String> params,
      required dynamic body,
      Map<String, String>? headers}) async {
    dynamic responseJson;
    try {
      debugPrint(jsonEncode(body));
      debugPrint(jsonEncode(params));
      var url = Uri.https(_baseUrl, endpoint, params);
      var response = await http.post(url,
          headers: headers ?? _headers, body: jsonEncode(body));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw NoNetworkException();
    }
    return responseJson;
  }

  Future<dynamic> postWithBodyWithoutJsonEncode(
      {required String endpoint,
      required Map<String, String> params,
      required dynamic body,
      Map<String, String>? headers}) async {
    dynamic responseJson;
    try {
      debugPrint(jsonEncode(body));
      debugPrint(jsonEncode(params));
      var url = Uri.https(_baseUrl, endpoint, params);
      var response =
          await http.post(url, headers: headers ?? _headers, body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw NoNetworkException();
    }
    return responseJson;
  }

  Future<dynamic> getBase64({required String path}) async {
    dynamic responseJson;
    try {
      var url = Uri.parse(path);
      var response = await http.get(url, headers: _base64Headers);
      responseJson = response.body;
    } on SocketException {
      throw NoNetworkException();
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        debugPrint(responseJson.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
