import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:ecommerce/Utils/Utils.dart';
import 'package:ecommerce/data/app_execaptions.dart';
import 'package:ecommerce/res/app_Url.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce/data/Network/BaseApiservices.dart';
import 'package:http/http.dart%20';

class NetworkApiServices extends BaseApiServices{
  @override
  Future getGetApiResponse(String url) async {
    if (kDebugMode) {
      print(url);
    }

    dynamic responsejson ;

    try{

      final response = await http.get(Uri.parse(url));
      responsejson = returnResponse(response);

    }on SocketException {
      throw BadRequestExecption(' invalid req');
    }on TimeoutException {
      throw FatchDataExecption('Network Request time out');
    }

    if (kDebugMode) {
      print(responsejson);
    }
    return responsejson;

  }


  @override
  Future getPostApiResponse(String url, data) {
    // TODO: implement getPostApiResponse
    throw UnimplementedError();
  }

  dynamic returnResponse (http.Response response){
    if (kDebugMode) {
      print(response.statusCode);
    }

    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson ;
      case 400:
        throw BadRequestExecption(response.body.toString());
      case 500:
      case 404:
        throw UnAuthorizedExecption(response.body.toString());
      default:
        throw FatchDataExecption('Error occured while communicating with server');

    }
  }


}
