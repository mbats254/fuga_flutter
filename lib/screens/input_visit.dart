import 'dart:convert';

import 'package:chips_choice/chips_choice.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
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
import 'package:intl/intl.dart';
import '../widgets/input.dart';
import 'package:rflutter_alert/rflutter_alert.dart';



class InputVisit extends StatelessWidget {
 final _formKey = GlobalKey<FormState>();
 List<String> tags = [];
 List<String> array_list = [];
 
 final TextEditingController farmController = TextEditingController();
 final TextEditingController vetController = TextEditingController();
 final format = DateFormat("yyyy-MM-dd");
 final TextEditingController dateController = TextEditingController();
List<String> all_farms = [];
List<String> all_officers = [];

  
 void __get_farms(List<String> all_farms) async {
   var data = await http.get("http://127.0.0.1:8000/api/farms");
    // print(data);
   var jsonData = jsonDecode(data.body); 
  //  print(jsonData[0]);
    // print((jsonData[1]['name']));
// setState((){
    var i;
    for(i=0;i<jsonData.length;i++){
          var details = jsonData[i]['id'];                    
          all_farms.add(details);        
           }       
    // });         
   
  }
 void __get_officers(List<String> all_officers) async {
   var data = await http.get("http://127.0.0.1:8000/officers/all/officers/api/");
    // print(data);
   var jsonData = jsonDecode(data.body); 
  // print(jsonData[0]);
    // print((jsonData[1]['name']));
// setState((){
    var i;
    for(i=0;i<jsonData.length;i++){
          var details = jsonData[i]['name']+'#'+jsonData[i]['county'];                    
          all_officers.add(details);        
           }   
               
            
// }); 

  }

      @override 
        void initState() {
          // super.initState();
        __get_officers(all_officers);
        __get_farms(all_farms);
        
       
      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "Input Visit",
          // searchBar: true,
        //   categoryOne: "Categories",
        //   categoryTwo: "Best Deals",
        ),
        backgroundColor: MaterialColors.bgColorScreen,
        // key: _scaffoldKey,
        drawer: MaterialDrawer(currentPage: "Input Visit"),
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
                      // print(all_farmers);
                    __get_officers(all_officers);
                  __get_farms(all_farms);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 12, bottom: 12),
                        child: Text("Generate Both Lists",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16.0))),
                  ),
                ),
              ),
        Padding(
                 padding: const EdgeInsets.all(8.0),
                 child:
                  ChipsChoice<String>.multiple(
                        value: tags,
                        onChanged: (val) => setState(() => tags = val),
                                                choiceItems: C2Choice.listFrom<String, String>(
                                                  source: all_farms,
                                                  value: (i, v) => v,
                                                  label: (i, v) => v,
                                                  tooltip: (i, v) => v,
                                                ),
                                              ),
                                              
                                       ),
        Padding(
                 padding: const EdgeInsets.all(8.0),
                 child:
                  ChipsChoice<String>.multiple(
                        value: tags,
                        onChanged: (val) => setState(() => tags = val),
                                                choiceItems: C2Choice.listFrom<String, String>(
                                                  source: all_farms,
                                                  value: (i, v) => v,
                                                  label: (i, v) => v,
                                                  tooltip: (i, v) => v,
                                                ),
                                              ),
                                              
                                       ),
                                      
                                       Padding(
                                        padding: const EdgeInsets.only(top: 32.0),
                                        child: TextFormField(
                                            controller:vetController,
                                            keyboardType: TextInputType.number,
                                    validator: (value) => EmailValidator.validate(value) ? null : "Please enter a valid email",
                                    decoration: const InputDecoration(
                                      hintText: 'Enter Visit`s',
                                    ),
                                
                                  ),
                                      ),
                                         Padding(
                                        padding: const EdgeInsets.only(top: 32.0),
                                        child:  DateTimeField(
                                       format: format,
                                      decoration: InputDecoration(hintText: 'Date of Visit'),
                                      onShowPicker: (context, currentValue) {
                                        return showDatePicker(
                                            context: context,
                                            firstDate: DateTime(1900),
                                            initialDate: currentValue ?? DateTime.now(),
                                            lastDate: DateTime(2100)
                                            ).then((dateselected){
                                              dateController.text = dateselected.toString();
                                            });
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
                                        //  __get_farms(all_farms);
                                        //  print(all_farms);
                                        //  __get_officers(all_officers);
                                        final String vet = vetController.text;
                                        final String date = dateController.text;
                                        String farms = jsonEncode(tags);
                                            createVisit(String farms,  String vet, String date) async{
                                          final String apiUrl = 'http://127.0.0.1:8000/api/visits/';
                                          final headers = {'Content-Type':'application/json'};
                                         Map body = ({ 
                                                'farms': farms,
                                                'vet': vet,
                                                'date' :date
                                         
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
                        
                                                await createVisit(farms, vet, date).then((value)  { 
                                              
                                          //  if(value == null)
                                          //  {
                                          //     Alert(
                                          //   context: context, 
                                              
                                          //     title: "Warning", desc: "Visit Added Successfully"
                                              
                                              
                                          //     ).show();
                                          //       // Navigator.pushNamed(context, 'single/farmer' , arguments: {'mobile': mobile });
                                          //  }
                                          //  else
                                          //  {
                                          //       Alert(
                                          //   context: context, 
                                              
                                          //     title: "Warning", desc: "Visit could not be added"
                                              
                                              
                                          //     ).show();
                                          
                                      
                                          //  Navigator.pushNamed(context, 'send/money' , arguments: {'uniqid': uniqid});
                                 
                                          
                                          //  }
                                           });
                                        
                                            },
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(4.0),
                                            ),
                                            child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 16.0, right: 16.0, top: 12, bottom: 12),
                                                child: Text("Submit Visit",
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
                        
                          setState(List<String> Function() param0) {}
}
