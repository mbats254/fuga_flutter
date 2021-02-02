import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

import 'package:material_kit_flutter/constants/Theme.dart';

import 'package:material_kit_flutter/widgets/drawer-tile.dart';
import '../screens/login_page.dart';
class MaterialDrawer extends StatelessWidget {
  final String currentPage;

  MaterialDrawer({this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          child: Column(children: [
        DrawerHeader(
            decoration: BoxDecoration(color: MaterialColors.drawerHeader),
            child: Container(
                // padding: EdgeInsets.symmetric(horizontal: 28.0),
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://fuga.africa/wp-content/uploads/brizy/7/assets/images/iW=147&iH=70&oX=0&oY=0&cW=147&cH=70/transparent_fuga.png"),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 16.0),
                  child: Text("Fuga App",
                      style: TextStyle(color: Colors.white, fontSize: 21)),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: MaterialColors.label),
                            child: Text("",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Text("",
                            style: TextStyle(
                                color: MaterialColors.muted, fontSize: 16)),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text("",
                                style: TextStyle(
                                    color: MaterialColors.warning,
                                    fontSize: 16)),
                          ),
                          // Icon(Icons.star_border,
                          //     color: MaterialColors.warning, size: 20)
                        ],
                      )
                    ],
                  ),
                )
              ],
            ))),
        Expanded(
            child: ListView(
          padding: EdgeInsets.only(top: 8, left: 8, right: 8),
          children: [
            DrawerTile(
                icon: Icons.home,
                onTap: () {
                  if (currentPage != "Home")
                    Navigator.pushReplacementNamed(context, '/home');
                },
                iconColor: Colors.black,
                title: "Home",
                isSelected: currentPage == "Home" ? true : false),
        
            DrawerTile(
                icon: Icons.settings_input_component,
                onTap: () {
                  if (currentPage != "Farmers_List")
                    Navigator.pushReplacementNamed(context, '/farmers/list');
                },
                iconColor: Colors.black,
                title: "Farmer's List",
                isSelected: currentPage == "Farmers_List" ? true : false),
            DrawerTile(
                icon: Icons.account_circle,
                onTap: () {
                  if (currentPage != "Input Farmer")
                    Navigator.pushReplacementNamed(context, '/input/farmers');
                },
                iconColor: Colors.black,
                title: "Input Farmer",
                isSelected: currentPage == "InputFarmer" ? true : false),
            DrawerTile(
                icon: Icons.account_circle,
                onTap: () {
                  if (currentPage != "Input")
                    Navigator.pushReplacementNamed(context, '/input/visit');
                },
                iconColor: Colors.black,
                title: "Input Visit",
                isSelected: currentPage == "Input" ? true : false),
            // DrawerTile(
            //     icon: Icons.settings,
            //     onTap: () {
            //       if (currentPage != "Settings")
            //         Navigator.pushReplacementNamed(context, '/settings');
            //     },
            //     iconColor: Colors.black,
            //     title: "Settings",
            //     isSelected: currentPage == "Settings" ? true : false),
            DrawerTile(
                icon: Icons.exit_to_app,
                onTap: () {
                  if (currentPage != "Sign In")
           Navigator.push(context, new MaterialPageRoute(builder: (context) => LoginScreen()
           ));
                },
                iconColor: Colors.black,
                title: "Sign In",
                isSelected: currentPage == "Sign In" ? true : false),
            // DrawerTile(
            //     icon: Icons.open_in_browser,
            //     onTap: () {
            //       if (currentPage != "Sign Up")
            //         Navigator.pushReplacementNamed(context, '/signup');
            //     },
            //     iconColor: Colors.black,
            //     title: "Sign Up",
            //     isSelected: currentPage == "Sign Up" ? true : false),
          ],
        ))
      ])),
    );
  }
}
