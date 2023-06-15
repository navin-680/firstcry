import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FirstCry"),
        elevation: 4,
          backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Login / Register",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              const Text(
                "Email ID / Mobile No.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const TextField(
                decoration: InputDecoration(
                    hintText: "Enter your Email Id or Mobile No."),
              ),
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
              const Row(children: <Widget>[
                Expanded(child: Divider()),
                Text(" OR "),
                Expanded(child: Divider()),
              ]),
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
              const Center(
                  child: Text(
                "New to FirstCry?Register Here",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
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
    );
  }
}
