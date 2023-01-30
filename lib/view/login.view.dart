import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:last_mobile/util/colors.dart';
import 'package:last_mobile/view/home.view.dart';
import 'package:last_mobile/sidebar/navigation_drawer.dart';

import 'package:last_mobile/view/sign_up.view.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/auth_controller.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final usuarioController = new AuthController();
  final usercontr = TextEditingController();
  final passcontr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image(
                width: double.infinity,
                height: 350.0,
                fit: BoxFit.cover,
                image: AssetImage('../../assets/image/child.png'),
              ),
            ],
          ),
          Transform.translate(
            offset: Offset(0.0, -20.0),
            child: Container(
              width: double.infinity,
              height: 500,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                    children: [
                      Text("Bienvenido",
                          style: TextStyle(
                              color: negro,
                              fontWeight: FontWeight.bold,
                              fontSize: 40.0)),
                      Text("Inicia sesión en tu cuenta",
                          style: TextStyle(
                              color: gris,
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0)),
                      Container(
                        margin: EdgeInsets.only(top: 40.0),
                        padding: EdgeInsets.only(left: 20.0),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(142, 142, 147, 1.2),
                            borderRadius: BorderRadius.circular(30.0)),
                        child: TextField(
                          controller: usercontr,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: 'Usuario',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        padding: EdgeInsets.only(left: 20.0),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(142, 142, 147, 1.2),
                            borderRadius: BorderRadius.circular(30.0)),
                        child: TextField(
                          controller: passcontr,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: 'Contraseña',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                      ),
                      Container(
                        width: 350.0,
                        height: 50.0,
                        margin: EdgeInsets.only(top: 40.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                            );
                            // authController.loginUser();
                            // usuarioController.login(usercontr.text, passcontr.text);
                          },
                          child: Text(
                            'Ingresar',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28.0),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// Widget _emailInput() {
  
//   return Container(
//     margin: EdgeInsets.only(top: 40.0),
//     padding: EdgeInsets.only(left: 20.0),
//     decoration: BoxDecoration(
//         color: Color.fromRGBO(142, 142, 147, 1.2),
//         borderRadius: BorderRadius.circular(30.0)),
//     child: TextField(
//       keyboardType: TextInputType.emailAddress,
      
//       decoration: InputDecoration(
//           hintText: 'Email',
//           border: OutlineInputBorder(borderSide: BorderSide.none)),
//     ),
//   );
// }

// Widget _passwordInput(TextEditingController name) {
  
//   return Container(
//     margin: EdgeInsets.only(top: 15.0),
//     padding: EdgeInsets.only(left: 20.0),
//     decoration: BoxDecoration(
//         color: Color.fromRGBO(142, 142, 147, 1.2),
//         borderRadius: BorderRadius.circular(30.0)),
//     child: TextField(
//       obscureText: true,
//       controller: name,
//       decoration: InputDecoration(
//           hintText: 'Password',
//           border: OutlineInputBorder(borderSide: BorderSide.none)),
//     ),
//   );
// }

// Widget _buttonLogin(BuildContext context, AutController autController) {
//   return Container(
//     width: 350.0,
//     height: 50.0,
//     margin: EdgeInsets.only(top: 40.0),
//     child: ElevatedButton(
//       onPressed: () {
//         autController.loginUser(user, password)
//       },
//       child: Text(
//         'Login',
//         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
//       ),
//       style: ElevatedButton.styleFrom(
//           backgroundColor: green,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(28.0),
//           )),
//     ),
//   );
// }
