import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../view/home.view.dart';

class AuthController {
  Future<http.Response> login(
      String username, String password, BuildContext context) async {
    final body = {
      "usuario": username,
      "password": password,
    };
    final url = 'https://hostingweb0-001-site4.atempurl.com/api/Auth';
    final uri = Uri.parse(url);
    final response = await http.post(
      uri,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      alertError(context);
    }
    return response;
  }

  void alertError(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.topSlide,
      showCloseIcon: true,
      title: "Error",
      desc: "Contraseña y/o Usuario incorrecto",
      btnOkOnPress: () {},
    ).show();
  }
}
