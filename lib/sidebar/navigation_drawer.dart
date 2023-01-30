import 'package:flutter/material.dart';
import 'package:last_mobile/util/colors.dart';
import 'package:last_mobile/view/login.view.dart';
import '../view/usuario.view.dart';
import 'drawer_item.dart';
import '../view/productos.view.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: greenbtn,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 80, 24, 0),
          child: Column(
            children: [
              headerWidget(),
              const SizedBox(
                height: 40,
              ),
              const Divider(
                thickness: 1,
                height: 10,
                color: Colors.black,
              ),
              const SizedBox(
                height: 40,
              ),
              DrawerItem(
                name: 'Productos',
                icon: Icons.inventory,
                onPressed: () => onItemPressed(context, index: 0),
              ),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                  name: 'Usuarios',
                  icon: Icons.account_box_rounded,
                  onPressed: () => onItemPressed(context, index: 1)),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                  name: 'Favourites',
                  icon: Icons.favorite_outline,
                  onPressed: () => onItemPressed(context, index: 2)),
              const SizedBox(
                height: 30,
              ),
              const Divider(
                thickness: 1,
                height: 10,
                color: Colors.black,
              ),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                  name: 'Log out',
                  icon: Icons.logout,
                  onPressed: () => onItemPressed(context, index: 3)),
            ],
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}) {
    Navigator.pop(context);

    switch (index) {
      case 0:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProductScreen()));

        break;
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const UserScreen()));
        break;
      case 2:
        break;
      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginView()));
        break;
    }
  }

  Widget headerWidget() {
    return Container(
      width: 200.0,
      height: 100.0,
      child: Image.asset(
        "../../assets/image/lastmen-removebg-preview.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
