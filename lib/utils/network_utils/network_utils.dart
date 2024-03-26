import "dart:async";
import "dart:convert";

import "package:flutter/material.dart";
import 'package:http/http.dart' as http;

class NetworkUtils{

  Future<dynamic> get(Uri url, Map<String, String> header) async {
    await http.get(url, headers: header).then((response) {
      final String bodyResponse = response.body;
      final int statusResponse = response.statusCode;

      debugPrint(bodyResponse);
      debugPrint(statusResponse.toString());

      if(statusResponse == 200 ||
         statusResponse == 201 ||
         statusResponse == 202 ||
         statusResponse == 206 ||
         statusResponse == 401 ||
         statusResponse == 403 ||
         statusResponse == 400 
      ) {
        return bodyResponse;
      } else {
        throw bodyResponse;
      }
    }).catchError((dynamic error){
      throw Exception(error);
    });
  }

  Future<dynamic> post(Uri url, Map<String, String> header, String body) async {
    return http.post(url, headers: header, body: body).then((http.Response response) {
      final String bodyResponse = response.body;
      final int statusResponse = response.statusCode;

      debugPrint(bodyResponse);
      debugPrint(statusResponse.toString());

      if(statusResponse == 200 ||
         statusResponse == 201 ||
         statusResponse == 202 ||
         statusResponse == 206 ||
         statusResponse == 401 ||
         statusResponse == 403 ||
         statusResponse == 400 ||
         statusResponse == 422
      ) {
        return json.decode(bodyResponse);
      } else {
        throw bodyResponse;
      }
    }).catchError((dynamic error){
      throw Exception(error);
    });
  }
  
  Future<dynamic> put(Uri url, Map<String, String> header, String body) async {
    await http.put(url, headers: header, body: body).then((response) {
      final String bodyResponse = response.body;
      final int statusResponse = response.statusCode;

      debugPrint(bodyResponse);
      debugPrint(statusResponse.toString());

      if(statusResponse == 200 ||
         statusResponse == 201 ||
         statusResponse == 202 ||
         statusResponse == 206 ||
         statusResponse == 401 ||
         statusResponse == 403 ||
         statusResponse == 400 ||
         statusResponse == 422
      ) {
        return bodyResponse;
      } else {
        throw bodyResponse;
      }
    }).catchError((dynamic error){
      throw Exception(error);
    });
  }

  Future<dynamic> delete(Uri url, Map<String, String> header, String body) async {
    http.delete(url,headers: header, body: body).then((response) {
      final String bodyResponse = response.body;
      final int statusResponse = response.statusCode;

      debugPrint(bodyResponse);
      debugPrint(statusResponse.toString());

      if(statusResponse == 200 ||
         statusResponse == 201 ||
         statusResponse == 202 ||
         statusResponse == 206 ||
         statusResponse == 401 ||
         statusResponse == 403 ||
         statusResponse == 400 
      ) {
        return bodyResponse;
      } else {
        throw bodyResponse;
      }
    }).catchError((dynamic error){
      throw Exception(error);
    });
  }
}