import 'package:flutter/material.dart';
import 'package:mini_project/incentive.dart';

class Valid extends StatelessWidget {
  const Valid({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
      home: Scaffold(


        body: MyStatefulWidget(),
      ),
    );
  }
}
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:  BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.pink[100]!, Colors.amber[300]!])),
        child : Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Thanks for Your Help!!',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 40),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Activate Incentives for User',
                  style: TextStyle(fontSize: 30),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepOrangeAccent, // Background color
                  ),
                  onPressed: () {

                    String policeuser = nameController.text;
                    var str1 = 'admin';
                    var res = policeuser.compareTo(str1);
                    String policepass = passwordController.text;
                    var str2 = 'police';
                    var res1 = policepass.compareTo(str2);

                    if(res==0 && res1==0)
                      {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) => Incentive()));
                      }
                    else{
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            content: Text('Wrong Police Department Password!!'),
                          );
                        },
                      );
                    }
                  },
                )
            ),

          ],
        )),
    );
  }
}