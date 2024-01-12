import 'dart:convert';
import 'dart:developer';

import 'package:api_learning/model/auth_model.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

Future<void> registration({required Map<String, dynamic> data}) async {
  var url = Uri.parse("https://api.escuelajs.co/api/v1/users/");

  try {
    //http.Response response = await http.post(url,body: data);

    http.post(url, body: data).then((response) {
      if (response.statusCode == 201) {
        Fluttertoast.showToast(msg: "Registration is done successfully");
      } else {
        Fluttertoast.showToast(
            msg: "Something went wrong statusCode: ${response.statusCode}");
      }
    });
  } catch (e) {
    if (kDebugMode) {
      print(e);
      Fluttertoast.showToast(msg: "$e");
    }
  }
}

Future<AuthModel?> login({required Map<String, dynamic> data}) async {
  var url = Uri.parse("https://api.escuelajs.co/api/v1/auth/login");

  try {
    http.post(url, body: data).then((response) {
      if (response.statusCode == 201) {
        Fluttertoast.showToast(msg: "Login is done successfully");
        log(response.body);
        final data = json.decode(response.body);
        AuthModel authData = AuthModel.fromJson(data);
        return authData;
      } else {
        Fluttertoast.showToast(
            msg: "Something went wrong statusCode: ${response.statusCode}");
        return null;
      }
    });
  } catch (e) {
    Fluttertoast.showToast(msg: "$e");
    return null;
  }
  return null;
}
