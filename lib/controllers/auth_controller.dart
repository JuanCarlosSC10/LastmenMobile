import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// class AutController {
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   Future loginUser() async {
//     const url = "http://lastpro-001-site1.btempurl.com/api/Auth";

//     var response = await http.post(Uri.parse(url),
//         body: jsonEncode({
//           "usuario": usernameController.text,
//           "password": passwordController.text,
//         }));
//     if (response.statusCode == 200) {
//       var loginArr = json.decode(response.body);
//       // save this token in shared prefrences and make user logged in and navigate

//       print(loginArr['token']);
//     } else {
//       print(response.body);
//     }
//   }
// }

class AuthController {
  Future<http.Response> login(String username, String password) async {
    final response = await http.post(
        Uri.parse('https://hostingweb0-001-site4.atempurl.com/api/Auth'),
        body: {'usuario': username, 'password': password});
    if (response.statusCode == 200) {
      // get the token from the response
      print(response.statusCode);
    print(response.body);
      var token = response.headers['authorization'];
      // store the token
      var a = token.toString();
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', a);
    }
    return response;
    
  }
 
}
