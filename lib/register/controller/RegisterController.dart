import 'package:first_cry_demo/home/views/home_page.dart';
import 'package:first_cry_demo/register/model/RegisterModel.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterController extends GetxController{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  RegisterModel data =RegisterModel();
  RxBool showPassword=false.obs;

  Future<void> addUser() async {
    users.where("email_id", isEqualTo: "navar680@gmail.com2").where("password",isEqualTo: "NaRak007").get().then(
          (querySnapshot) {
        if(querySnapshot.docs.isNotEmpty){
          Get.snackbar("User Already Exits", "Please use different email id");

        }else{
           users
              .add({
            'full_name': data.fullName, // John Doe
            'mobile_number': data.mobileNo, // Stokes and Sons
            'email_id': data.email,
            'password':data.password// 42
          })
              .then((value) =>{
                Get.snackbar("User Created Successfully ", ""),
                Get.to(HomePage())
           })
              .catchError((error) => print("Failed to add user: $error"));
        }

      },
      onError: (e) => print("Error completing: $e"),
    );



  }


  String? isEmail(String value) {

    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regex = RegExp(p);
    if (value.isEmpty) {
      return 'Please enter email id';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid email id';
      } else {
        return null;
      }
    }
  }
  String? validatePassword(String value) {
    RegExp regex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid password';
      } else {
        return null;
      }
    }
  }

  String? validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter mobile number';
    }
    else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }
}