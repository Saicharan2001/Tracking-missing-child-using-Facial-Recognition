import 'package:flutter/material.dart';
import 'package:mini_project/home_page.dart';
import 'package:mini_project/services/LaunchServices.dart';
import 'package:mini_project/widgets/app_button.dart';
import 'incentive.dart';

class MyHomePage1 extends StatefulWidget {
  @override
  _MyHomePageState1 createState() => _MyHomePageState1();
}

class _MyHomePageState1 extends State<MyHomePage1> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:  BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.purple[50]!, Colors.orange[300]!])),
    child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildRaisedButton('Nearest PoliceStation', launchURL1),
            heightSpacer(25.00),
            buildRaisedButton('Translate', launchURL2),
            heightSpacer(25.00),
            buildRaisedButton('Nearest Hospital', launchURL3),
            heightSpacer(25.00),
            buildRaisedButton('Call Police', launchCALL),
            heightSpacer(25.00),
            //buildRaisedButton('Send SMS', launchSMS),
            //heightSpacer(25.00),
            AppButton(
              text: "To HomeScreen",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              color: Color(0xFFFF6161),
            ),
            SizedBox(
              height:10,
            ),
          ],

        ),

      ),
    )
    );
  }

  Widget buildRaisedButton(String text, dynamic event) {
    return RaisedButton(
      textColor: Colors.white,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xFF0D47A1),
              Color(0xFF1976D2),
              Color(0xFF42A5F5),
            ],
          ),
        ),
        padding: const EdgeInsets.all(10.0),
        child:  Text(text),

      ),
      onPressed: event,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      elevation: 8,

    );
  }

  Widget heightSpacer(double myheight) {
    return SizedBox(height: myheight);
  }
}
