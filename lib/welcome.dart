import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:scanner/SignIn/mainpage.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _welcomeMessage(
              message: "Hello there !",
              size: 28,
              duration: const Duration(milliseconds: 200),
              color: Colors.white,
            ),
            const SizedBox(height: 26),
            _welcomeMessage(
              message: "Create your first QR code",
              size: 43,
              duration: const Duration(milliseconds: 500),
              color: const Color.fromRGBO(14, 214, 214, 1),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.3),
            Container(
              alignment: Alignment.bottomCenter,
              child: DelayedWidget(
                delayDuration: const Duration(milliseconds: 1000),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromRGBO(164,98,90,1),
                    padding: const EdgeInsets.only(top:15,bottom: 15,left:50,right:50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Login(),
                    ));
                  },
                  child: const Text(
                    "Create",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _welcomeMessage(
      {required String message,
      required double size,
      required Duration? duration,
      required Color color}) {
    return DelayedWidget(
      delayDuration: duration!,
      animationDuration: const Duration(seconds: 1),
      animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
      child: Text(
        message,
        style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
