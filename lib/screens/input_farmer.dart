import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:material_kit_flutter/constants/Theme.dart';

//widgets
import 'package:material_kit_flutter/widgets/navbar.dart';
import 'package:material_kit_flutter/widgets/card-horizontal.dart';
import 'package:material_kit_flutter/widgets/card-small.dart';
import 'package:material_kit_flutter/widgets/card-square.dart';
import 'package:http/http.dart' as http;
import 'package:email_validator/email_validator.dart';
import 'package:material_kit_flutter/widgets/drawer.dart';
import 'single_farmer.dart';
import '../widgets/input.dart';
import 'package:rflutter_alert/rflutter_alert.dart';



class InputFarmer extends StatelessWidget {
 final _formKey = GlobalKey<FormState>();
 final TextEditingController nameController = TextEditingController();
 final TextEditingController mobileController = TextEditingController();
 final TextEditingController countyController = TextEditingController();


 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "Input Farmer",
          // searchBar: true,
        //   categoryOne: "Categories",
        //   categoryTwo: "Best Deals",
        ),
        backgroundColor: MaterialColors.bgColorScreen,
        // key: _scaffoldKey,
        drawer: MaterialDrawer(currentPage: "Input Farmer"),
        body: Container(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
               Padding(                
                padding: const EdgeInsets.only(top: 32.0),
                child:
                 Form(
        key: _formKey,      
        child: Column(
        children: <Widget>[
         TextFormField(
           controller:nameController,
            decoration: const InputDecoration(
              hintText: 'Enter Farmer`s name',
            ),
            validator: (value) {
             print(value);
             
              return null;
            },
          ),
              
               Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: TextFormField(
                    controller:mobileController,
                    keyboardType: TextInputType.number,
            validator: (value) => EmailValidator.validate(value) ? null : "Please enter a valid email",
            decoration: const InputDecoration(
              hintText: 'Enter Farmer`s Mobile Number',
            ),
        
          ),
              ),
                 Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: TextFormField(
                  controller:countyController,
            decoration: const InputDecoration(
              hintText: 'Enter Farmer`s County',
            ),
            validator: (value) {     
             
               return 'Please enter county';
            },
          ),
              ),
               Padding(
                  padding:
                      const EdgeInsets.only(left: 34.0, right: 34.0, top: 16),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: MaterialColors.defaultButton,
                    onPressed: () async {
                 final String name = nameController.text;
                final String mobile = mobileController.text;
                final String county = countyController.text;
          
                    createFarmer(String name,  String mobile, String county) async{
                  final String apiUrl = 'http://127.0.0.1:8000/api/farmers/';
                  final headers = {'Content-Type':'application/json'};
                 Map body = ({ 
                        'name': name,
                        'phone_no': mobile,
                        'county' :county
                 
                        });

                  final response = await http.post(apiUrl, body: body);                  
                  // SharedPreferences sharedPrefernces = await SharedPreferences.getInstance();
                  if(response.statusCode == 200)
                  { 
                    final String responseString = response.body;
               
                    
                    return responseString;
                  }
                  else{
                    // return response.statusCode;
                    return null;
                  }
                    }

                        await createFarmer(name, mobile, county).then((value)  { 
                      
                   if(value == null)
                   {
                      Alert(
                    context: context, 
                      
                      title: "Warning", desc: "Farmer Added Successfully"
                      
                      
                      ).show();
                        // Navigator.push(context, 'single/farmer' , arguments: {'mobile': mobile });
                   }
                   else
                   {
                        Alert(
                    context: context, 
                      
                      title: "Warning", desc: "Farmer could not be added"
                      
                      
                      ).show();
                  
              
                  //  Navigator.pushNamed(context, 'send/money' , arguments: {'uniqid': uniqid});
         
                  
                   }
                   });
                
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 12, bottom: 12),
                        child: Text("Submit Farmer",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16.0))),
                  ),
                ),
            
            
                SizedBox(height: 8.0),
        ],
                 ),
               ),
            ),
     
              ],
            ),
          ),
        ));
  }
}
