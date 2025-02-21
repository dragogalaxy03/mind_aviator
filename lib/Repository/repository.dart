import 'package:flutter/material.dart';
import 'package:tv/Api%20Service/Network/network-api.dart';
import 'package:tv/Api%20Service/api_service.dart';
import 'package:tv/Constant/app_url.dart';

class Repository{
  final BaseApiServices baseApiServices = NetworkApiServices();

  Future<dynamic> getLogin({required BuildContext context, required dynamic body,}) async {
    final respose = await baseApiServices.getPostApiResponse(url: AppUrl.LOGIN, context: context, request: body,);
    return respose;
  }


  getHeaders(){
     return{ "Content-Type": "application/json"};
  }
  getUrl(){

  }
}
