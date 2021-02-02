import 'dart:math';

import 'package:email_validator/email_validator.dart';
import '../constants/Theme.dart';
import '../widgets/navbar.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';


import 'package:rflutter_alert/rflutter_alert.dart';
// import 'dart:async'
import 'package:flutter_session/flutter_session.dart';
import '../widgets/navbar.dart';
import '../widgets/card-horizontal.dart';
import '../widgets/card-small.dart';
import '../widgets/card-square.dart';
import '../widgets/drawer.dart';

import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';



void main() => runApp(LoginScreen());

/// This is the main application widget.
class LoginScreen extends StatelessWidget {
  static const String _title = 'Login Page';

  @override 

  Widget build(BuildContext context) {
    return MaterialApp(
        
  routes: {
    // When navigating to the "/" route, build the FirstScreen widget.
  
    // When navigating to the "/second" route, build the SecondScreen widget.
    
  },
      title: _title,
      home: Scaffold(
         appBar: Navbar(
          title: "Login",
          searchBar: false,
      
        ),
        body: MyStatefulWidget(),
        drawer: MaterialDrawer(currentPage: "Login"),
      ),
    );
  }
}

// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
    Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
        backgroundColor: Colors.grey.shade900,
        body: Container(
      
        child: 
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: MyStatefulWidget(),
            
            
          ),
        ),
      ),      
    );
  }
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller:emailController,
            // validator: (value) => EmailValidator.validate(value) ? null : "Please enter a valid email",
            decoration: const InputDecoration(
              hintText: 'Email Address',
            ),
            // validator: (value)  => EmailValidator.validate(value) ? null : "Please enter a valid email",
          ),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              hintText: 'Password',              
             
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter password';
              }
              return null;
            },
          ),

          SizedBox(height: 32,),
      SizedBox(
                width: double.infinity,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 34.0, right: 34.0, top: 8),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: MaterialColors.primary,
                onPressed: () async{
                  
                final String email = emailController.text;
                final String password = passwordController.text;
                // print(email);
                 loginUser(String email, String password) async{
                  final String apiUrl = 'http://127.0.0.1:8000/api/login';
                  final headers = {'Content-Type':'application/json'};
                 Map body = ({ 
                        'email': email,
                        'password': password
                        });

                  final response = await http.post(apiUrl, body: body);
                  
                  // SharedPreferences sharedPrefernces = await SharedPreferences.getInstance();
                  if(response.statusCode == 200)
                  { 
                    final String responseString = response.body;
                  setState((){
                    // sharedPrefernces.setString('results', responseString);  
                  });
                    
                    return responseString;
                  }
                  else{
                    // return response.statusCode;
                    return null;
                  }
                 }
                 await loginUser(email, password).then((value)  {

                   print(value);
                   if(value == '912')
                   {
                      Alert(
                    context: context, 
                      
                      title: "Warning", desc: "Wrong Credentials"
                      
                      
                      ).show();
                   }
                   else
                   {
                    var response = value.split("#");
                   var second_part = response[1].split('"');
                   
                   var uniqid = second_part[0];
                       print(response);
                   if(response[0] == '"admin')
                   {
                        
                         Navigator.pushNamed(context, 'admin/dashboard' , arguments: {'uniqid': uniqid});
                   }
                   else if(response[0] == '"customer')
                  {    
                      
                       if(response[2] == '+ve"') 
                       {
                         Navigator.pushNamed(context, 'send/money' , arguments: {'uniqid': uniqid});
                       }  
                       else
                       {
                         Navigator.pushNamed(context, 'welcome/user' , arguments: {'uniqid': uniqid});
                       }       
                  //  
         
                  }
                   }
  
                 });

                setState(() {
                  // _user =  user;
                });

                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  // Process data.
                     Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 12, bottom: 12),
                        child: Text("Submit",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16.0))),
                  ),
                ),
              ),
         
    
        ],
      ),
    );
  }
}
