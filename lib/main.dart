import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scanner/create_qr.dart';
import 'package:scanner/homepage.dart';
import 'package:scanner/qrpage.dart';
import 'package:scanner/welcome.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Supabase.initialize(
    url: 'https://kbnyukvybqqbuxvnogzu.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYzNTkxNDQyMywiZXhwIjoxOTUxNDkwNDIzfQ.6W5tF5CaQ8Lw-YKdq1RZCFlksw4g6pYODYB8t7BlGaM',
  );
  runApp(const MyApp());
}

check() {
  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    return false;
  } else {
    return true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scanner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: check()
          ? HomePage(pages: [const CreateQR(), QRViewExample()])
          : HomePage(pages: [const WelcomePage(), QRViewExample()]),
      debugShowCheckedModeBanner: false,
    );
  }
}
