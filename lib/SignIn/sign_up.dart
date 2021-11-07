import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scanner/SignIn/components/authentication.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: const Text("SignUp via email"),
            ),
            Container(
              margin: const EdgeInsets.only(top: 18),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                leading: const Icon(Icons.email_outlined),
                title: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration:
                      const InputDecoration.collapsed(hintText: "Email"),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 9),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                leading: const Icon(Icons.password_outlined),
                title: TextFormField(
                  obscureText: _isVisible,
                  controller: password,
                  decoration:
                      const InputDecoration.collapsed(hintText: "password"),
                ),
                trailing: IconButton(
                  icon: _isVisible?const Icon(Icons.remove_red_eye):const Icon(CupertinoIcons.eye_slash_fill),
                  onPressed: () {
                    setState(() {
                      _isVisible = !_isVisible;
                    });
                  },
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 18),
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  AuthenticationHelper().signUp(
                    email: emailController.text,
                    password: password.text,
                    context: context,
                  );
                },
                child: const Text("Register"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange.shade400,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
