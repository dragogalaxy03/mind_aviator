
import 'package:flutter/material.dart';

abstract class BaseApiServices {



  Future<dynamic> getGetApiResponse({
    required String url,
    dynamic headers,
    required BuildContext context
  });

  Future<dynamic> getPostApiResponse({
    required String url,
    dynamic request,
    dynamic headers,
    required BuildContext context
  });
}
