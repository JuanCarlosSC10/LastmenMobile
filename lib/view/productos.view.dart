import 'package:flutter/material.dart';
import 'package:last_mobile/sidebar/navigation_drawer.dart';
import 'package:last_mobile/util/colors.dart';
import 'home.view.dart';
import 'login.view.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
    );
  }
}
