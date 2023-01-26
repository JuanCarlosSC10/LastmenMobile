import 'package:flutter/material.dart';
import 'package:last_mobile/sidebar/navigation_drawer.dart';

import 'login.view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavigationDrawer(),
        appBar: AppBar(
          // title: const Text('Home'),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Builder(builder: (context) {
          return Center(
            child: SelectionArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text('BIENVENIDO A LASTMEN'),
                
              ],
            ),
          ),
          );
        }));
  }
}
