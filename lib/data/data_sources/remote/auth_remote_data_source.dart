import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:test_task/core/classes/exceptions.dart';
import 'package:test_task/core/network/api_endpoints.dart';
import 'package:test_task/data/models/response_model.dart' as r;

class AuthRemoteDataSource {
  Future<r.Response> login(loginData) async {
    log(loginData);
    final http.Response response = await http.post(
      Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.login),
      body: loginData,
    );
    try {
      log(response.body);
      var data = json.decode(response.body);
      return r.Response.fromJson(data);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  Future<r.Response> register(registerData) async {
    log(registerData);
    final http.Response response = await http.post(
      Uri.parse(
          ApiEndpoints.baseUrl + ApiEndpoints.user + ApiEndpoints.register),
      body: registerData,
    );
    try {
      log(response.body);
      var data = json.decode(response.body);
      return r.Response.fromJson(data);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
