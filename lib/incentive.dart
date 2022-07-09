import 'dart:io';
import 'package:mini_project/profile.dart';
import 'package:mini_project/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/home_page.dart';

class Incentive extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFD54F),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,

                    ),
                    margin: EdgeInsets.all(20),
                    width: 50,
                    height: 10,
                    // child: Transform(
                    //     alignment: Alignment.center,
                    //     child: FittedBox(
                    //       fit: BoxFit.cover,
                    //       child: Image.file(File(imagePath)),
                    //     ),
                    //     transform: Matrix4.rotationY(mirror)),
                  ),
                  const Text(
                    'Collect Your Incentives !!!',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xFFFFEBEE),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children:  const [
                    Text(
                      'Thanks For Your Help !!! ',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                    Divider(
                      height: 10,
                    ),
                    Text(
                      'You can claim your Rewards by Copying Coupon code ',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                    Divider(
                      height: 10,
                    ),


                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xFFFFEBEE),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children:  const [
                    Icon(
                      Icons.attach_money_outlined,
                      size: 15,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Zomato Coupon get 50% Off !',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                    Divider(
                      height: 10,
                    ),
                    Text(
                      'Coupon Code :- HAPPYGH50 ',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                    Divider(
                      height: 10,
                    ),
                    Text(
                      'Offer eligible only when you pay using Paytm ' ,
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                    Divider(
                      height: 10,
                    ),
                    Text(
                      'Offer Duration is 30 Days From Now',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                    Divider(
                      height: 10,
                    ),

                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xFFFFEBEE),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children:  const [
                    Icon(
                      Icons.attach_money_outlined,
                      size: 15,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Get upto to Rs 500 Cashback on Domino\'s Pizza ',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                    Divider(
                      height: 10,
                    ),
                    Text(
                      'Coupon Code :- GBTG500 ',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                    Divider(
                      height: 10,
                    ),
                    Text(
                      'Offer Eligible Only when you pay using Amazon Pay' ,
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                    Divider(
                      height: 10,
                    ),
                    Text(
                      'Offer Duration is 7 Days from Now',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                    Divider(
                      height: 10,
                    ),

                  ],
                ),
              ),
              Spacer(),
              AppButton(
                text: "Back To Home",
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
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
