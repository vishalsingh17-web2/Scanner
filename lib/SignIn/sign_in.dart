import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scanner/SignIn/components/authentication.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _isVisible = true;
  bool _forgotpassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _forgotpassword
                ? Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: const Text(
                      "*Login via email",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.only(left: 20),
                    child:
                        const Text("Enter your email to reset your password"),
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
            _forgotpassword
                ? Container(
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
                        decoration: const InputDecoration.collapsed(
                            hintText: "password"),
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
                  )
                : Container(),
            _forgotpassword
                ? Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _forgotpassword = false;
                        });
                      },
                      child: const Text("Forgot password?"),
                    ),
                  )
                : Container(),
            _forgotpassword
                ? Container(
                    margin: const EdgeInsets.only(top: 9),
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        AuthenticationHelper().signIn(
                          email: emailController.text,
                          password: password.text,
                          context: context,
                        );
                      },
                      child: const Text("Login"),
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
                  )
                : Container(
                    margin: const EdgeInsets.only(top: 18),
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        AuthenticationHelper().forgotPassword(
                          email: emailController.text,
                          context: context,
                        );
                      },
                      child: const Text("Reset"),
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
            _forgotpassword
                ? Container()
                : Container(
                    margin: const EdgeInsets.only(top: 9),
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _forgotpassword = true;
                        });
                      },
                      child: const Text("Back"),
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
            _forgotpassword
                ? Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "OR",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                : Container(),
            _forgotpassword
                ? Container(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () => AuthenticationHelper()
                          .signInwithGoogle(context: context),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text("Login with Google"),
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
                : Container(),
          ],
        ),
      ),
    );
  }
}
