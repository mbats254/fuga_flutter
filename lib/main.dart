import 'package:flutter/material.dart';

// screens
import 'package:material_kit_flutter/screens/home.dart';

import 'package:material_kit_flutter/screens/farmers_list.dart';
import 'package:material_kit_flutter/screens/input_farmer.dart';
import 'package:material_kit_flutter/screens/input_visit.dart';
import 'package:material_kit_flutter/screens/onboarding.dart';
import 'package:material_kit_flutter/screens/single_farmer.dart';

void main() => runApp(MaterialKitPROFlutter());

class MaterialKitPROFlutter extends StatelessWidget {
  static const routeName = "/single/farmer";
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
 
        title: "Material Kit PRO Flutter",
        debugShowCheckedModeBanner: false,
        initialRoute: "/onboarding",
        routes: <String, WidgetBuilder>{
          "/onboarding": (BuildContext context) => new Onboarding(),
          "/home": (BuildContext context) => new Home(),         
          "/farmers/list": (BuildContext context) => new Farmers_List(),
          "/input/farmers": (BuildContext context) => new InputFarmer(),
          "/input/visit": (BuildContext context) => new InputVisit(),
          "/single/farmer": (BuildContext context) => new SingleFarmer(),
         
        });
  }
}
