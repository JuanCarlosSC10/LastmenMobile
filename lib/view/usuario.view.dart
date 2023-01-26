import 'package:flutter/material.dart';
import 'package:last_mobile/sidebar/navigation_drawer.dart';
import 'package:last_mobile/util/colors.dart';
import 'home.view.dart';
import 'login.view.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuario'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
    );
  }
}
