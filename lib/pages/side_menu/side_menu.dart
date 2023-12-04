import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/common/routes/names.dart';
import 'package:learning_app/pages/home/home_page.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text('Log out'),
            onTap: () => Navigator.of(context).pushNamed(AppRoutes.SETTINGS),
          )
        ],
      ),
    );
  }
}
