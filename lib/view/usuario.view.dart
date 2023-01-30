import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:last_mobile/util/colors.dart';
import 'sign_up.view.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  bool isLoading = true;
  List usuarios = [];

  @override
  void initState() {
    super.initState();
    getUsuarios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuarios'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Visibility(
        visible: isLoading,
        child: Center(child: CircularProgressIndicator()),
        replacement: RefreshIndicator(
          onRefresh: getUsuarios,
          child: Visibility(
            visible: usuarios.isNotEmpty,
            replacement: Center(
              child: Text(
                'No hay usuarios registrados',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            child: ListView.builder(
              itemCount: usuarios.length,
              padding: EdgeInsets.all(12),
              itemBuilder: (context, index) {
                final user = usuarios[index] as Map;
                final id = user['idUsuario'];
                return Card(
                  color: green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(child: Text('${index + 1}')),
                    title: Text(user['nombres']),
                    subtitle: Text(user['apellidos']),
                    trailing: PopupMenuButton(
                      onSelected: (value) {
                        if (value == 'editar') {
                          //Open edit page
                          navigateToEditPage(user);
                        } else if (value == 'eliminar') {
                          //delete edit page
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.question,
                            animType: AnimType.topSlide,
                            showCloseIcon: true,
                            title: "Advertencia",
                            desc: "¿Seguro que desea eliminar un usuario?",
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {
                              deleteById(id);
                            },
                          ).show();
                        }
                      },
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            child: Text('Editar'),
                            value: 'editar',
                          ),
                          PopupMenuItem(
                            child: Text('Eliminar'),
                            value: 'eliminar',
                          ),
                        ];
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: navigateToAddPage, label: Text('Registrar Usuario')),
    );
  }

  void alertSucces() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.topSlide,
      showCloseIcon: true,
      title: "Exitoso",
      desc: "Usuario eliminado",
      btnOkOnPress: () {},
    ).show();
  }

  Future<void> navigateToEditPage(Map user) async {
    final route = MaterialPageRoute(
      builder: (context) => SignUpPage(todo: user),
    ); // MaterialPageRoute
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
    getUsuarios();
  }

  Future<void> navigateToAddPage() async {
    final route = MaterialPageRoute(
      builder: (context) => SignUpPage(),
    ); // MaterialPageRoute
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
    getUsuarios();
  }

  Future<void> deleteById(int id) async {
    var uri =
        Uri.http('hostingweb0-001-site4.atempurl.com', '/api/Usuario/$id');
    final response = await http.delete(uri);
    if (response.statusCode == 200) {
      final filtered =
          usuarios.where((element) => element['idUsuario'] != id).toList();
      setState(() {
        usuarios = filtered;
      });
      alertSucces();
    } else {}
  }

  Future<void> getUsuarios() async {
    final url = 'https://hostingweb0-001-site4.atempurl.com/api/Usuario';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      // final json = jsonDecode(response.body) as Map;
      final json = jsonDecode(response.body);
      setState(() {
        usuarios = json;
      });
    }
    setState(() {
      isLoading = false;
    });
  }
}
