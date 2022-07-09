import 'package:mini_project/database/database.dart';
import 'package:mini_project/home_page.dart';
import 'package:mini_project/models/user_model.dart';
import 'package:mini_project/profile.dart';
import 'package:mini_project/services/camera_service.dart';
import 'package:mini_project/services/facenet_service.dart';
import 'package:mini_project/valid.dart';
import 'package:mini_project/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'app_text_field.dart';

class AuthActionButton extends StatefulWidget {
   AuthActionButton(this._initializeControllerFuture,
      { Key? key, required this.onPressed, required this.isLogin, required this.reload});
  final Future _initializeControllerFuture;
  final Function onPressed;
  final bool isLogin;
  final Function reload;
  @override
  _AuthActionButtonState createState() => _AuthActionButtonState();
}
/// service injection
final FaceNetService _faceNetService = FaceNetService.faceNetService;
final CameraService _cameraService = CameraService();

final TextEditingController _userTextEditingController =
TextEditingController(text: '');
final TextEditingController _birthTextEditingController =
TextEditingController(text: '');
final TextEditingController _parentContactTextEditingController =
TextEditingController(text: '');
final TextEditingController _addressTextEditingController =
TextEditingController(text: '');
final TextEditingController _passwordTextEditingController =
TextEditingController(text: '');
final TextEditingController _policeTextEditingController =
TextEditingController(text: '');

 User? predictedUser;

Future _signUp(context) async {
  /// gets predicted data from facenet service (user face detected)
  DatabaseHelper _databaseHelper = DatabaseHelper.instance;
  List? predictedData = _faceNetService.predictedData;
  print('AuthactionPredicatedData: $predictedData');
  String? user = _userTextEditingController.text;
  String? password = _passwordTextEditingController.text;
  String? birth = _birthTextEditingController.text;
  String? contact = _parentContactTextEditingController.text;
  String? address = _addressTextEditingController.text;
  User userToSave = User(
    user: user,
    password: password,
    birth: birth,
    contact: contact,
    address: address,
    modelData: predictedData,
  );
  /// creates a new user in the 'database'
  String policepass = _policeTextEditingController.text;
  var str1 = 'police';
  var res = policepass.compareTo(str1);
  if(res==0)
    {
      print("dataFromdatabase555==$predictedData");
      await _databaseHelper.insert(userToSave);

      _faceNetService.setPredictedData(null);

      _userTextEditingController.text="";
      _passwordTextEditingController.text="";
      _birthTextEditingController.text =  "";
      _parentContactTextEditingController.text = "";
      _addressTextEditingController.text = "";
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => MyHomePage()));
    }
  else
    {
      // _faceNetService.setPredictedData(null);
      _userTextEditingController.text="";
      _passwordTextEditingController.text="";
      _birthTextEditingController.text =  "";
      _parentContactTextEditingController.text = "";
      _addressTextEditingController.text = "";
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text('Wrong Police Department Password!!'),
          );
        },
      );
    }


}
  /// resets the face stored in the face net sevice



Future _signIn(context) async {
  String password = _passwordTextEditingController.text;
  if (predictedUser!.password == password) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => Profile(
              predictedUser!.user,
              predictedUser!.birth,
              predictedUser!.address,
              predictedUser!.contact,
              imagePath: _cameraService.imagePath!,
            )));
  } else {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          content: Text('Wrong Verification Code!'),
        );
      },
    );
  }
}


Future<User?> _predictUser() async{
  User? userAndPass = await _faceNetService.predict();
  return userAndPass;
}

class _AuthActionButtonState extends State<AuthActionButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        try {
          // Ensure that the camera is initialized.
          await widget._initializeControllerFuture;
          // onShot event (takes the image and predict output)
          bool faceDetected = await widget.onPressed();

          if (faceDetected) {
            if (widget.isLogin) {
                var user = await _predictUser();
                print("NullIssue======${user?.user}");
                if (user != null) {
                  predictedUser = user;

                }else{
                  predictedUser = null;
                }
            }


  PersistentBottomSheetController bottomSheetController =
  Scaffold.of(context)
      .showBottomSheet((context) => signSheet(context,predictedUser));
  bottomSheetController.closed.whenComplete(() => widget.reload());


          }
        } catch (e) {
          // If an error occurs, log the error to the console.
          print("dataFromdatabaseAuth1==$e");
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:Colors.deepOrange[300],
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.blue.withOpacity(0.1),
              blurRadius: 1,
              offset: Offset(0, 2),
            ),
          ],
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        width: MediaQuery.of(context).size.width * 0.8,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'SCAN IMAGE',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.camera_alt, color: Colors.white)
          ],
        ),
      ),
    );
  }

  signSheet(context, User? predictedUser) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.isLogin && predictedUser != null
              ? Container(
            child: Column(
              children: [
                Text(
                  'Missing Child Detected, Name : ' + predictedUser.user,
                  style: TextStyle(fontSize: 20),
                ),
                Divider(),
                Text(
                  'Date of Birth : ' + predictedUser.birth,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            )
          )

              : widget.isLogin
              ? Container(
              child: const Text(
                'Not a Missing Child ✖',
                style: TextStyle(fontSize: 20),
              ))
              : Container(),
          Container(
            child: Column(
              children: [
                !widget.isLogin
                    ? AppTextField(
                  controller: _policeTextEditingController,
                  labelText: "Police Password",
                )
                    : Container(),
                SizedBox(height: 10),

                !widget.isLogin
                    ? AppTextField(
                  controller: _userTextEditingController,
                  labelText: "Child Name",
                )
                    : Container(),
                SizedBox(height: 10),

                !widget.isLogin
                    ? AppTextField(
                  controller: _birthTextEditingController,
                  labelText: "Date of Birth",
                )
                    : Container(),
                SizedBox(height: 10),

                !widget.isLogin
                    ? AppTextField(
                  controller: _parentContactTextEditingController,
                  labelText: "Parent's Contact Details",
                )
                    : Container(),
                SizedBox(height: 10),
                !widget.isLogin
                    ? AppTextField(
                  controller: _addressTextEditingController,
                  labelText: "Contact Address",
                )
                    : Container(),
                SizedBox(height: 10),
                widget.isLogin && predictedUser == null
                    ? Container()
                    : AppTextField(
                  controller: _passwordTextEditingController,
                  labelText: "Verification Code",
                  isPassword: false,
                ),
                SizedBox(height: 10),
                Divider(),
                SizedBox(height: 10),
                widget.isLogin && predictedUser != null
                    ? AppButton(
                  text: 'Get Details',
                  onPressed: () async {
                    _signIn(context);
                  },
                  icon: Icon(
                    Icons.login,
                    color: Colors.white,
                  ),
                )
                    : !widget.isLogin?
                     AppButton(
                  text: 'REGISTER',
                  onPressed: () async {
                    await _signUp(context);
                  },
                  icon: Icon(
                    Icons.person_add,
                    color: Colors.white,
                  ),
                )
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );

  }

  @override
  void dispose() {
    super.dispose();
  }
  // signInSheet({@required User? user}) => user == null
  //     ? Container(
  //   width: MediaQuery.of(context).size.width,
  //   padding: EdgeInsets.all(20),
  //   child: Text(
  //     'User not found 😞',
  //     style: TextStyle(fontSize: 20),
  //   ),
  // )
  //     : signInSheet(user: user);
}
