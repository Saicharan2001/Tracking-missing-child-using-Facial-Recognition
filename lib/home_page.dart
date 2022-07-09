import 'package:mini_project/incentive.dart';
import 'package:mini_project/services/facenet_service.dart';
import 'package:mini_project/services/ml_kit_service.dart';
import 'package:mini_project/signin.dart';
import 'package:mini_project/signup.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:mini_project/valid.dart';
import 'package:mini_project/widgets/app_text_field.dart';

import 'database/database.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FaceNetService _faceNetService = FaceNetService.faceNetService;
  MLKitService _mlKitService = MLKitService();
  // DataBaseService _dataBaseService = DataBaseService();

  late CameraDescription cameraDescription;
  bool loading = false;
   bool incent = false;

  // final TextEditingController _policeTextEditingController =
  // TextEditingController(text: '');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startup();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.purple, Colors.orange])),
     child: Scaffold(
       backgroundColor: Colors.transparent,
      appBar: AppBar(
        leading: Container(),
        elevation: 0,
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text('Child Recognition'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20, top: 20),
            child: PopupMenuButton<String>(
              child: Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              onSelected: (value) {
                switch (value) {
                  case 'Clear':
                    DatabaseHelper _dataBaseHelper = DatabaseHelper.instance;
                    _dataBaseHelper.deleteAll();
                    break;
                }
              },
              itemBuilder: (BuildContext context) {
                return {'Clear'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ),
        ],
      ),
      body: !loading
          ? SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Image(image: AssetImage('assets/logo.png')),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: const [
                    Text(
                      "Missing Child Detection !!",
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Follow instructions to help a missing child, reach their home. Call 100 to get Verification Code",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => const Valid(

                                  ),
                                ),
                              );

                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFF00695C),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.1),
                            blurRadius: 1,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 16),
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Collect Incentives ',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.celebration, color: Colors.white)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => SignIn(
                            cameraDescription:cameraDescription,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFF00695C),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.1),
                            blurRadius: 1,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          vertical: 14, horizontal: 16),
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Scan Child',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.document_scanner_sharp, color: Colors.white)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => SignUp(
                            cameraDescription: cameraDescription,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFF00695C),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.1),
                            blurRadius: 1,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          vertical: 14, horizontal: 16),
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Register Child',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.app_registration_sharp, color: Colors.white)
                        ],
                      ),
                    ),
                  ),

                ],
              )
            ],
          ),
        ),
      )
          : Center(
        child: CircularProgressIndicator(),
      ),
    ));
  }
  void _startup() async{
    _setLoading(true);

    List<CameraDescription> cameras = await availableCameras();

    /// takes the back camera
    cameraDescription = cameras.firstWhere(
          (CameraDescription camera) =>
      camera.lensDirection == CameraLensDirection.back,
    );

    // start the services
    await _faceNetService.loadModel();
  //  await _dataBaseService.loadDB();
    _mlKitService.initialize();

    _setLoading(false);
  }

  void _setLoading(bool value) {

    setState(() {
      loading = value;
    });
  }



}
