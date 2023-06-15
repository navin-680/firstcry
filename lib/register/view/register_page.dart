import 'package:first_cry_demo/register/controller/RegisterController.dart';
import 'package:first_cry_demo/register/model/RegisterModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class RegisterPage extends StatelessWidget {
   RegisterPage({super.key});
  final RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    var passwordVisible = false;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.arrow_back_ios_new),
                Text(
                  " Register",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Form(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Full Name",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter Your Full Name',
                  ),
                  onSaved: (String? value) {
                    // This optional block of code can be used to run
                    // code when the user saves the form.
                  },
                  validator: (String? value) {
                    return (value != null && value.contains('@'))
                        ? 'Do not use the @ char.'
                        : null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "Mobile Number",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter Your Mobile Number',
                  ),
                  onSaved: (String? value) {
                    // This optional block of code can be used to run
                    // code when the user saves the form.
                  },
                  validator: (String? value) {
                    return (value != null && value.contains('@'))
                        ? 'Do not use the @ char.'
                        : null;
                  },
                ),
                const Text(
                  "OTP  will be sent on this Mobile No. for verification",
                  style: TextStyle(fontSize: 12),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "Email Id",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter Your Email Id',
                  ),
                  onSaved: (String? value) {
                    // This optional block of code can be used to run
                    // code when the user saves the form.
                  },
                  validator: (String? value) {
                    return (value != null && value.contains('@'))
                        ? 'Do not use the @ char.'
                        : null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "Password",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter Your Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          /* setState(() {
                          passwordVisible = !passwordVisible;
                        });*/
                        },
                      ),
                    ),
                    onSaved: (String? value) {
                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
                    validator: (String? value) {
                      return (value != null && value.contains('@'))
                          ? 'Do not use the @ char.'
                          : null;
                    },
                    obscureText: !passwordVisible),
                const Text(
                  "Password must be at least 8 characters long with 1 Uppercase , 1 Lowercase & 1 Numeric Character.",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            )),

            SizedBox (
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  controller.addUser(RegisterModel(fullName: "vikas",mobileNo: 1234567890,email: "vikad",password: "1234"));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4), // <-- Radius
                  ),
                ),
                child: const Text(
                  "CONTINUE",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
