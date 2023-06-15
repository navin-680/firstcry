import 'package:first_cry_demo/login/controller/login_controller.dart';
import 'package:first_cry_demo/register/view/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FirstCry"),
        elevation: 4,
          backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView (
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Login / Register",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Email ID / Mobile No.",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const TextField(
                  decoration: InputDecoration(
                      hintText: "Enter your Email Id or Mobile No."),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Password",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Obx(
                      () => TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter Your Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.showPassword.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () {
                            controller.showPassword.value =
                            !controller.showPassword.value;
                          },
                        ),
                      ),
                      onSaved: (String? value) {

                      },
                      validator: (String? value) {
                        return (controller.validatePassword(value!));
                      },
                      obscureText: controller.showPassword.value),
                ),
                const Text(
                  "Password must be at least 8 characters long with 1 Uppercase , 1 Lowercase & 1 Numeric Character.",
                  style: TextStyle(fontSize: 12),
                ),
                const SizedBox(height: 40,),
                SizedBox(

                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {},
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
                const SizedBox(height: 20,),
                const Row(children: <Widget>[
                  Expanded(child: Divider()),
                  Text(" OR "),
                  Expanded(child: Divider()),
                ]),
                const SizedBox(height: 20,),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: OutlinedButton.icon(
                    label: const Text(
                      'Continue with Google     ',
                      style: TextStyle(color: Colors.black),
                    ),
                    icon: Image.asset(
                      'assets/icons/google.png',
                      fit: BoxFit.fitWidth,
                      width: 30,
                      height: 30,
                    ),
                    onPressed: () {
                      print('Pressed');
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4), // <-- Radius
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: OutlinedButton.icon(
                    label: const Text(
                      'Continue with Facebook',
                      style: TextStyle(color: Colors.black),
                    ),
                    icon: const Icon(
                      Icons.facebook_rounded,
                      size: 30,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      print('Pressed');
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4), // <-- Radius
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                 Center(
                    child: GestureDetector(
                      onTap: (){
                        Get.to(RegisterPage());
                      },
                      child: const Text(
                  "New to FirstCry?Register Here",
                  style:
                        TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
                ),
                    )),
                const Divider(),
                const Text.rich(TextSpan(
                    text: "By continuing, you agree to FirstCry's ",
                    children: <InlineSpan>[
                      TextSpan(
                        text: 'Conditions of Use',
                        style: TextStyle(color: Colors.blue),
                      ),
                      TextSpan(text: " and"),
                      TextSpan(
                        text: ' Privacy Notice.',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ])),
              ]),
        ),
      ),
    );
  }
}
