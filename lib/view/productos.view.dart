import 'dart:convert';
import 'dart:html';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:last_mobile/sidebar/navigation_drawer.dart';
import 'package:last_mobile/util/colors.dart';
import 'package:http/http.dart' as http;

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool isLoading = true;
  List productos = [];

  @override
  void initState() {
    super.initState();
    fetchProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Visibility(
        visible: isLoading,
        child: Center(child: CircularProgressIndicator()),
        replacement: RefreshIndicator(
          onRefresh: fetchProduct,
          child: Visibility(
            visible: productos.isNotEmpty,
            replacement: Text(
              'No hay productos registrados',
              style: Theme.of(context).textTheme.headline3,
            ),
            child: ListView.builder(
              itemCount: productos.length,
              padding: EdgeInsets.all(12),
              itemBuilder: (context, index) {
                final product = productos[index] as Map;
                return Card(
                  color: green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    // side: const BorderSide(
                    //   color: Colors.black,
                    // ),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(child: Text('${index + 1}')),
                    title: Text(product['nombreProducto']),
                    subtitle: Text(product['descripcion']),
                    trailing: Text('Stock: ' + product['cantidad'].toString()),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //     onPressed: () {}, label: Text('Agregar Producto')),
    );
  }

  // void navigateToAddPage() {
  Future<void> fetchProduct() async {
    final url = 'http://lastpro-001-site1.btempurl.com/api/Producto';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      // final json = jsonDecode(response.body) as Map;
      final json = jsonDecode(response.body);
      setState(() {
        productos = json;
      });
    }
    setState(() {
      isLoading = false;
    });
  }
}
