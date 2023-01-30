import 'dart:async';
import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:last_mobile/util/colors.dart';
import 'package:last_mobile/widgets/back_button.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatefulWidget {
  final Map? todo;
  const SignUpPage({
    super.key,
    this.todo,
  });

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  int usercontr = 0;
  final usuariocontroller = TextEditingController();
  final tipoUsuariocontroller = TextEditingController();
  final nombrescontroller = TextEditingController();
  final apellidoscontroller = TextEditingController();
  final direccioncontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final correocontroller = TextEditingController();
  bool isEdit = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final todo = widget.todo;
    if (todo != null) {
      isEdit = true;
      final id = todo['idUsuario'];
      final user = todo['usuario'];
      final nomb = todo['nombres'];
      final apell = todo['apellidos'];
      final tipous = todo['tipoUsuario'];
      final direc = todo['direccion'];
      final pass = todo['password'];
      final email = todo['correo'];
      usercontr = id;
      usuariocontroller.text = user;
      tipoUsuariocontroller.text = tipous;
      nombrescontroller.text = nomb;
      apellidoscontroller.text = apell;
      direccioncontroller.text = direc;
      passwordcontroller.text = pass;
      correocontroller.text = email;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Builder(builder: (BuildContext context) {
          return backButton(context, Colors.black);
        }),
      ),
      body: Center(
          child: Container(
        padding: EdgeInsets.all(30),
        child: Column(children: [
          Text(isEdit ? 'Editar Usuario' : 'Crear Usuario',
              style: TextStyle(
                  color: negro, fontWeight: FontWeight.bold, fontSize: 30.0)),
          _usernameInput(context, usuariocontroller),
          _nombresInput(context, nombrescontroller),
          _apellidosInput(context, apellidoscontroller),
          _tipoUserinput(context, tipoUsuariocontroller),
          _direccionInput(context, direccioncontroller),
          _passwordInput(context, passwordcontroller),
          _emailInput(context, correocontroller),
          Container(
            width: 350.0,
            height: 50.0,
            margin: EdgeInsets.only(top: 40.0),
            child: ElevatedButton(
              onPressed: isEdit ? actualizarUser : registeruser,
              child: Text(
                isEdit ? 'Actualizar' : 'Registrar',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.0),
                  )),
            ),
          ),
        ]),
      )),
    );
  }

  Future<void> actualizarUser() async {
    final todo = widget.todo;
    if (todo == null) {
      print('you can not call update');
      return;
    } else {}

    final idus = todo['idUsuario'];
    final user = usuariocontroller.text;
    final nombre = nombrescontroller.text;
    final apellido = apellidoscontroller.text;
    final tipoUser = tipoUsuariocontroller.text;
    final direc = direccioncontroller.text;
    final pass = passwordcontroller.text;
    final email = correocontroller.text;

    final body = {
      "idUsuario": idus,
      "usuario": user,
      "tipoUsuario": tipoUser,
      "nombres": nombre,
      "apellidos": apellido,
      "direccion": direc,
      "password": pass,
      "correo": email
    };
    final url = 'https://hostingweb0-001-site4.atempurl.com/api/Usuario';
    final uri = Uri.parse(url);
    final response = await http.put(
      uri,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      usuariocontroller.text = '';
      nombrescontroller.text = '';
      apellidoscontroller.text = '';
      tipoUsuariocontroller.text = '';
      direccioncontroller.text = '';
      passwordcontroller.text = '';
      correocontroller.text = '';
      alertSucces('Usuario actualizado exitosamente');
    } else {}
  }

  Future<void> registeruser() async {
    final user = usuariocontroller.text;
    final nombre = nombrescontroller.text;
    final apellido = apellidoscontroller.text;
    final tipoUser = tipoUsuariocontroller.text;
    final direc = direccioncontroller.text;
    final pass = passwordcontroller.text;
    final email = correocontroller.text;

    final body = {
      "usuario": user,
      "tipoUsuario": tipoUser,
      "nombres": nombre,
      "apellidos": apellido,
      "direccion": direc,
      "password": pass,
      "correo": email
    };
    final url = 'https://hostingweb0-001-site4.atempurl.com/api/Usuario';
    final uri = Uri.parse(url);
    final response = await http.post(
      uri,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      usuariocontroller.text = '';
      nombrescontroller.text = '';
      apellidoscontroller.text = '';
      tipoUsuariocontroller.text = '';
      direccioncontroller.text = '';
      passwordcontroller.text = '';
      correocontroller.text = '';
      alertSucces('Usuario registrado exitosamente');
    } else {}
  }

  void alertSucces(String text) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.topSlide,
      showCloseIcon: true,
      title: "Exitoso",
      desc: text,
      btnOkOnPress: () {},
    ).show();
  }

  void alertError() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.topSlide,
      showCloseIcon: true,
      title: "Error",
      desc: "Usuario no registrado",
      btnOkOnPress: () {},
    ).show();
  }
}

Widget _usernameInput(BuildContext context, control) {
  return Container(
    margin: EdgeInsets.only(top: 40.0),
    padding: EdgeInsets.only(left: 20.0),
    decoration:
        BoxDecoration(color: bgInput, borderRadius: BorderRadius.circular(40)),
    child: TextField(
      controller: control,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: 'Usuario',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _nombresInput(BuildContext context, control) {
  return Container(
    margin: EdgeInsets.only(top: 15.0),
    padding: EdgeInsets.only(left: 20.0),
    decoration:
        BoxDecoration(color: bgInput, borderRadius: BorderRadius.circular(40)),
    child: TextField(
      controller: control,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: 'Ingrese su Nombre',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _apellidosInput(BuildContext context, control) {
  return Container(
    margin: EdgeInsets.only(top: 15.0),
    padding: EdgeInsets.only(left: 20.0),
    decoration:
        BoxDecoration(color: bgInput, borderRadius: BorderRadius.circular(40)),
    child: TextField(
      controller: control,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: 'Ingrese su Apellido',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _tipoUserinput(BuildContext context, control) {
  return Container(
    margin: EdgeInsets.only(top: 15.0),
    padding: EdgeInsets.only(left: 20.0),
    decoration:
        BoxDecoration(color: bgInput, borderRadius: BorderRadius.circular(40)),
    child: TextField(
      controller: control,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: 'Tipo de Usuario',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _direccionInput(BuildContext context, control) {
  return Container(
    margin: EdgeInsets.only(top: 15.0),
    padding: EdgeInsets.only(left: 20.0),
    decoration:
        BoxDecoration(color: bgInput, borderRadius: BorderRadius.circular(40)),
    child: TextField(
      controller: control,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: 'Direccion',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _passwordInput(BuildContext context, control) {
  return Container(
    margin: EdgeInsets.only(top: 15.0),
    padding: EdgeInsets.only(left: 20.0),
    decoration:
        BoxDecoration(color: bgInput, borderRadius: BorderRadius.circular(40)),
    child: TextField(
      controller: control,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: 'Contraseña',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _emailInput(BuildContext context, control) {
  return Container(
    margin: EdgeInsets.only(top: 15.0),
    padding: EdgeInsets.only(left: 20.0),
    decoration:
        BoxDecoration(color: bgInput, borderRadius: BorderRadius.circular(40)),
    child: TextField(
      controller: control,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'Correo',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}
