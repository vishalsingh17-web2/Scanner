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
  TextEditingController confirmPassword = TextEditingController();
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
            passwordField(hintText: "password", controller: password),
            passwordField(hintText: "confirm password", controller: confirmPassword),
            Container(
              margin: const EdgeInsets.only(top: 18),
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  if(password.text==confirmPassword.text){
                    AuthenticationHelper().signUp(email: emailController.text, password: password.text, context: context);
                  }else{
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Error"),
                          content: const Text("Passwords do not match"),
                          actions: [
                            FlatButton(
                              child: const Text("Ok"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
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
            Container(
              alignment: Alignment.center,
              child: const Text(
                "OR",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () =>
                    AuthenticationHelper().signInwithGoogle(context: context),
                style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("Sign Up with Google"),
                    const SizedBox(width: 10),
                    Image.asset(
                      "assets/images/google.png",
                      height: 20,
                      width: 20,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget passwordField({required String hintText, required TextEditingController controller}) {
    return Container(
      margin: const EdgeInsets.only(top: 9),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: const Icon(Icons.password_outlined),
        title: TextFormField(
          obscureText: _isVisible,
          controller: controller,
          decoration: InputDecoration.collapsed(hintText: hintText),
        ),
        trailing: IconButton(
          icon: _isVisible
              ? const Icon(Icons.remove_red_eye)
              : const Icon(CupertinoIcons.eye_slash_fill),
          onPressed: () {
            setState(() {
              _isVisible = !_isVisible;
            });
          },
        ),
      ),
    );
  }
}
