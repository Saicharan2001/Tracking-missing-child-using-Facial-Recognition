import 'dart:convert';

class User {
  String user;
  String password;
  String birth;
  String contact;
  String address;
  List modelData;

  User({
    required this.user,
    required this.password,
    required this.birth,
    required this.contact,
    required this.address,
    required this.modelData,
  });

  static User fromMap(Map<String, dynamic> user) {
    return new User(
      user: user['user'],
      password: user['password'],
      birth: user['birth'],
      contact: user['contact'],
      address: user['address'],
      modelData: jsonDecode(user['model_data']),
    );
  }

  toMap() {
    return {
      'user': user,
      'password': password,
      'birth':birth,
      'contact':contact,
      'address':address,
      'model_data': jsonEncode(modelData),
    };
  }
}