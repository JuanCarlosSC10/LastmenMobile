import 'package:flutter/material.dart';
import 'package:last_mobile/util/colors.dart';
import 'package:last_mobile/widgets/back_button.dart';

class AddUser extends StatelessWidget {
  const AddUser({super.key});

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
          Text('Crear nueva Cuenta',
              style: TextStyle(
                  color: negro, fontWeight: FontWeight.bold, fontSize: 30.0)),
          _usernameInput(context),
          _nombresInput(context),
          _apellidosInput(context),
          _direccionInput(context),
          _passwordInput(context),
          _emailInput(context),
          Container(
            width: 350.0,
            height: 50.0,
            margin: EdgeInsets.only(top: 40.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Sign up',
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
  
}

Widget _usernameInput(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40.0),
    padding: EdgeInsets.only(left: 20.0),
    decoration:
        BoxDecoration(color: bgInput, borderRadius: BorderRadius.circular(40)),
    child: TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: 'Usuario',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}



Widget _nombresInput(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 15.0),
    padding: EdgeInsets.only(left: 20.0),
    decoration:
        BoxDecoration(color: bgInput, borderRadius: BorderRadius.circular(40)),
    child: TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: 'Ingrese su Nombre',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _apellidosInput(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 15.0),
    padding: EdgeInsets.only(left: 20.0),
    decoration:
        BoxDecoration(color: bgInput, borderRadius: BorderRadius.circular(40)),
    child: TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: 'Ingrese su Apellido',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _direccionInput(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 15.0),
    padding: EdgeInsets.only(left: 20.0),
    decoration:
        BoxDecoration(color: bgInput, borderRadius: BorderRadius.circular(40)),
    child: TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: 'Direccion',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _passwordInput(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 15.0),
    padding: EdgeInsets.only(left: 20.0),
    decoration:
        BoxDecoration(color: bgInput, borderRadius: BorderRadius.circular(40)),
    child: TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: 'Contraseña',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _emailInput(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 15.0),
    padding: EdgeInsets.only(left: 20.0),
    decoration:
        BoxDecoration(color: bgInput, borderRadius: BorderRadius.circular(40)),
    child: TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'Correo',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}
