import 'package:first_cry_demo/register/controller/RegisterController.dart';
import 'package:first_cry_demo/register/model/RegisterModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final RegisterController controller = Get.put(RegisterController());
  var _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
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
                key: _formKey,

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
                    controller.data.fullName = value;
                  },
                  validator: (String? value) {
                    return (value!.isEmpty)
                        ? 'Please enter full name'
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
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  onSaved: (String? value) {
                    controller.data.mobileNo = int.parse(value ?? "0");
                  },
                  validator: (String? value) {
                    return controller.validateMobile(value!);
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
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (String? value) {
                    controller.data.email = value;
                  },
                  validator: (String? value) {
                    return (controller.isEmail(value!));
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "Password",
                  style: TextStyle(fontWeight: FontWeight.bold),
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
                        controller.data.password = value;
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
              ],
            )),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: submit,
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
  void submit() {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    _formKey.currentState?.save();
    controller.addUser();

  }

}
