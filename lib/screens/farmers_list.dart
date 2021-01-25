import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:material_kit_flutter/constants/Theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;
import 'package:snapshot/snapshot.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:chips_choice/chips_choice.dart';

// import 'dart:async'
//widgets
import 'package:material_kit_flutter/widgets/navbar.dart';
import 'package:material_kit_flutter/widgets/drawer.dart';
import 'package:material_kit_flutter/widgets/input.dart';
import 'package:material_kit_flutter/widgets/card-horizontal.dart';
import 'package:material_kit_flutter/widgets/card-category.dart';
import 'package:material_kit_flutter/widgets/card-small.dart';
import 'package:material_kit_flutter/widgets/card-square.dart';
import 'package:material_kit_flutter/widgets/slider-product.dart';
import 'package:material_kit_flutter/widgets/photo-album.dart';

import 'package:material_kit_flutter/widgets/table-cell.dart';

final Map<String, Map<String, String>> homeCards = {
  "Ice Cream": {
    "title": "Hardly Anything Takes More Coura...",
    "image":
        "https://images.unsplash.com/photo-1539314171919-908b0cd96f03?crop=entropy&w=840&h=840&fit=crop",
    "price": "180"
  },
  "Makeup": {
    "title": "Find the cheapest deals on our range...",
    "image":
        "https://images.unsplash.com/photo-1515709980177-7a7d628c09ba?crop=entropy&w=840&h=840&fit=crop",
    "price": "220"
  },
  "Coffee": {
    "title": "Looking for Men's watches?",
    "image":
        "https://images.unsplash.com/photo-1490367532201-b9bc1dc483f6?crop=entropy&w=840&h=840&fit=crop",
    "price": "40"
  },
  "Fashion": {
    "title": "Curious Blossom Skin Care Kit.",
    "image":
        "https://images.unsplash.com/photo-1536303006682-2ee36ba49592?crop=entropy&w=840&h=840&fit=crop",
    "price": "188"
  },
  "Argon": {
    "title": "Adjust your watch to your outfit.",
    "image":
        "https://images.unsplash.com/photo-1491336477066-31156b5e4f35?crop=entropy&w=840&h=840&fit=crop",
    "price": "180"
  }
};

List<String> albumArray = [
  "https://images.unsplash.com/photo-1508264443919-15a31e1d9c1a?fit=crop&w=240&q=80",
  "https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?fit=crop&w=240&q=80",
  "https://images.unsplash.com/photo-1487376480913-24046456a727?fit=crop&w=240&q=80",
  "https://images.unsplash.com/photo-1494894194458-0174142560c0?fit=crop&w=240&q=80",
  "https://images.unsplash.com/photo-1500462918059-b1a0cb512f1d?fit=crop&w=240&q=80",
  "https://images.unsplash.com/photo-1542068829-1115f7259450?fit=crop&w=240&q=80"
];

List<Map<String, String>> imgArray = [
  {
    "img":
        "https://images.unsplash.com/photo-1501084817091-a4f3d1d19e07?fit=crop&w=2700&q=80",
    "title": "Painting Studio",
    "description":
        "You need a creative space ready for your art? We got that covered.",
    "price": "\$125",
  },
  {
    "img":
        "https://images.unsplash.com/photo-1500628550463-c8881a54d4d4?fit=crop&w=2698&q=80",
    "title": "Art Gallery",
    "description":
        "Don't forget to visit one of the coolest art galleries in town.",
    "price": "\$200",
  },
  {
    "img":
        "https://images.unsplash.com/photo-1496680392913-a0417ec1a0ad?fit=crop&w=2700&q=80",
    "title": "Video Services",
    "description":
        "Some of the best music video services someone could have for the lowest prices.",
    "price": "\$300",
  },
];

class Farmers_List extends StatefulWidget {
  @override
  _Farmers_ListState createState() => _Farmers_ListState();
}

class _Farmers_ListState extends State<Farmers_List> {
  bool switchValueOne;
  bool switchValueTwo;
  List<String> all_farmers = [];
  List<String> all_officers = [];
  List<String> tags = [];
   void __get_farmers(List<String> all_farmers) async {
   var data = await http.get("http://127.0.0.1:8000/api/farmers/");
    // print(data);
   var jsonData = jsonDecode(data.body); 
  //  print(jsonData[0]['name']);
    // print((jsonData[1]['name']));

    var i;
    for(i=0;i<jsonData.length;i++){
          var details = jsonData[i]['name']+'#'+jsonData[i]['county'];                    
          all_farmers.add(details);        
           }       
            
   
  }
   void __get_officers(List<String> all_officers) async {
   var data = await http.get("http://127.0.0.1:8000/officers/all/officers/api/");
    // print(data);
   var jsonData = jsonDecode(data.body); 
  //  print(jsonData[0]['name']);
    // print((jsonData[1]['name']));

    var i;
    for(i=0;i<jsonData.length;i++){
          var details = jsonData[i]['name']+'#'+jsonData[i]['county'];                    
          all_officers.add(details);        
           }       
            
   
  }
  void initState() {
   
    setState(() {
      switchValueOne = true;
      switchValueTwo = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "Farmers",
        ),
        backgroundColor: MaterialColors.bgColorScreen,
        drawer: MaterialDrawer(currentPage: "Farmers_List"),
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.only(right: 24, left: 24, bottom: 36),
          child: SafeArea(
            bottom: true,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 32),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("All Farmers` Page",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16)),
                ),
              ),

              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 34.0, right: 34.0, top: 16),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: MaterialColors.defaultButton,
                    onPressed: () {
                      // Respond to button press
                      // Navigator.pushReplacementNamed(context, '/home');
                       __get_farmers(all_farmers);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 12, bottom: 12),
                        child: Text("Generate Farmer's List",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16.0))),
                  ),
                ),
              ),
              // SizedBox(
              //   width: double.infinity,
              //   child: Padding(
              //     padding:
              //         const EdgeInsets.only(left: 34.0, right: 34.0, top: 16),
              //     child: RaisedButton(
              //       textColor: Colors.white,
              //       color: MaterialColors.defaultButton,
              //       onPressed: () {
              //         // Respond to button press
              //         // Navigator.pushReplacementNamed(context, '/home');
              //          __get_officers(all_officers);
              //       },
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(4.0),
              //       ),
              //       child: Padding(
              //           padding: EdgeInsets.only(
              //               left: 16.0, right: 16.0, top: 12, bottom: 12),
              //           child: Text("Generate Officer's List",
              //               style: TextStyle(
              //                   fontWeight: FontWeight.w600, fontSize: 16.0))),
              //     ),
              //   ),
              // ),
                      ChipsChoice<String>.multiple(
                        value: tags,
                        onChanged: (val) => setState(() => tags = val),
                        choiceItems: C2Choice.listFrom<String, String>(
                          source: all_farmers,
                          value: (i, v) => v,
                          label: (i, v) => v,
                          tooltip: (i, v) => v,
                        ),
                      ),
    
            ]),
          ),
        )));
  }
}
