import 'package:first_cry_demo/register/model/RegisterModel.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterController extends GetxController{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(RegisterModel model) {
    return users
        .add({
      'full_name': model.fullName, // John Doe
      'mobile_number': model.mobileNo, // Stokes and Sons
      'email_id': model.email,
      'password':model.password// 42
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}