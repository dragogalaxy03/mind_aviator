import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tv/Constant/const_var.dart';
import 'package:tv/Repository/repository.dart';


class AuthProvider with ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;
  Repository _repository = Repository();
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> login(BuildContext context, String userId, String mpin) async {
    _isLoading = true;
    notifyListeners();

    final Map<String, dynamic> body = {
      "user_id": userId,
      "mpin": mpin,
    };

    try {
      final response = await _repository.getLogin(context: context, body: jsonEncode(body));
      print(response);
      notifyListeners();
    }catch(e){
      print(e);
    }
    finally{
      _isLoading = false;
    }
  }
}
