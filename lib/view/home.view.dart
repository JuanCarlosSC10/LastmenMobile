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
              child: Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        '../../assets/image/hoja.png',
                        width: 100.0,
                      ),
                      Text('Bienvenido',
                          style: TextStyle(
                              fontSize: 45, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
