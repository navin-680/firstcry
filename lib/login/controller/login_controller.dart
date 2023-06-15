import 'package:first_cry_demo/register/view/register_page.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginController extends GetxController{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  RxBool showPassword=false.obs;
  var email,password="";
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

  bool checkLogin(){
    bool isValid =false;
   users.where("email_id", isEqualTo: "navar680@gmail.com2").where("password",isEqualTo: "NaRak007").get().then(
          (querySnapshot) {
        print("Successfully completed");
        if(querySnapshot.docs.isNotEmpty){
          for (var docSnapshot in querySnapshot.docs) {
            print('${docSnapshot.id} => ${docSnapshot.data()}');
          }
        }else{
          Get.snackbar(
            "Invalid Credentials",
            "Please check email and password"
          );
        }

      },
      onError: (e) => print("Error completing: $e"),
    );
    return isValid;
  }


}

