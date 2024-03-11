import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:waste_managemet_app/Screens/email_verification.dart';
import 'package:waste_managemet_app/Screens/home_page.dart';
import 'package:waste_managemet_app/Screens/login.dart';




// ignore: camel_case_types
class Signup_Controller extends StatefulWidget {
  const Signup_Controller({Key? key}) : super(key: key);

  @override
  State<Signup_Controller> createState() => Signup_ControllerState();
}

// ignore: camel_case_types
class Signup_ControllerState extends State<Signup_Controller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            if (snapshot.data!.emailVerified) {
              return const HomePage();
            } else {
              return const EmailVerificationScreen();
            }
          } else {
            return const Login();
          }
        },
      ),
    );
  }
}
