import 'package:flutter/material.dart';
// import 'register.dart';


// import 'package:rflutter_alert/rflutter_alert.dart';
// SystemChannels.textInput.invokeMethod('TextInput.hide');
void main() {
  runApp(MaterialApp(
    title: 'Named Routes Demo',
    
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/',
      routes: <String, WidgetBuilder>{

          // '/' : (BuildContext context) => Flexxon(),
          // '/login' : (BuildContext context) => LoginScreen(),
          // '/register' : (BuildContext context) => RegisterScreen(),
          
      },
       onUnknownRoute: (RouteSettings settings) {
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (BuildContext context) =>
            Scaffold(body: Center(child: Text('Not Found'))),
      );
    },
      
  ));
}

class Flexxon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Container(
      
        child: 
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Onboarding(),
            
            
          ),
        ),
      ),      
    );
  }
}

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}
 
class _OnboardingState extends State<Onboarding> {
  // List<Icon> scorekeeper = [ Icon(
  //           Icons.check,
  //           color:Colors.green,            
  //         ),
  //         Icon(
  //           Icons.close,
  //           color:Colors.red,            
  //         ),
  //        Icon(
  //           Icons.close,
  //           color:Colors.red,            
  //         ),
  //        Icon(
  //           Icons.close,
  //           color:Colors.red,            
  //         ),
  //         ];
  @override
  Widget build(BuildContext context) {
    return Column(
   
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
       
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                'Welcome to Fuga.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
 
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'View Dashboard',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                 Navigator.pushReplacementNamed(context, '/home');
              },
            ),
          ),
        ),
        Row(
          // children:scorekeeper,
          )
        
      ],
      
    );
  }
}



/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/














