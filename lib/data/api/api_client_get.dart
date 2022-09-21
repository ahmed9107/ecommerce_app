
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClientGet extends GetConnect implements GetxService {
  //late String token;
  final String appBaseUrl;
  final SharedPreferences sharedPrefs;

  /// Map<key, Value>
  late Map<String, String> _mainHeaders;
  final String _basicAuth = 'Basic${base64Encode(utf8.encode('u314730127_Az:@ZamiLemarshalS0tA'))}';

  ApiClientGet({required this.appBaseUrl, required this.sharedPrefs}) {
    /// baseUrl  is a String from get_connect package so Getx management system
    /// should know what is your base Url "appBaseUrl" so you pass it to that one "baseUrl"
    /// and each time you make a request "timeout" in this example 30 sec
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    //token = sharedPrefs.getString(AppConstants.TOKEN)??"";
    _mainHeaders = {
      'authorization': _basicAuth
    };
    /* _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    }; */
  }

  /* void updateHeader(String token){
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
  } */

  Future<Response> getData(String uri , {Map<String, String>? headers}) async {
    try {
      Response response = await get(uri, headers: headers??_mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: 'FROM GET DATA METHOD AN APICLT ${e.toString()}');
    }
  }

  Future<Response> postData(String uri, Map body) async {
    try{
      Response response = await post(uri, body , headers: _mainHeaders);
      return response;
    }catch(e){
      debugPrint('FROM POST DATA METHOD AN APICLT ${e.toString()}');
      return Response(statusCode: 1, statusText: 'FROM POST DATA METHOD AN APICLT ${e.toString()}');
    }
  }
}
