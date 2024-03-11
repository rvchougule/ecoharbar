import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart'; // Import your login page here

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EmailVerificationScreenState createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Function to send email verification link
  Future<void> _sendEmailVerification() async {
    try {
      User? user = _auth.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        print('Email verification link sent');
        // Navigate to the login page
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const Login()), // Navigate to your login page
        ).then((_) {
          // Show registration completed pop-up message
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Registration Completed"),
                content: const Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("You have successfully completed the registration."),
                    SizedBox(height: 10),
                    Text("Please login to continue."),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("OK"),
                  ),
                ],
              );
            },
          );
        });
      } else {
        print('No user or email already verified');
      }
    } catch (e) {
      print('Error sending verification email: $e');
      // Show error message to the user or handle the error accordingly
    }
  }

  @override
  void dispose() {
    // Cancel any ongoing asynchronous operations here
    super.dispose();
  }

  String? emailVerify;
  void emailAdd(String name) {
    emailVerify = name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          color: Colors.white,
          shadowColor: Colors.black,
          elevation: 20.0,
          child: SizedBox(
            height: 540,
            width: 330,
            child: Column(children: [
              Image.asset("assets/assets/Email/Email_1.jpg"),
              const SizedBox(height: 10),
              const Text(
                "Confirm your email address",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
              ),
              const Text("We sent a confirmation email to:"),
              const Text("*********@gmail.com"),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _sendEmailVerification,
                child: const Text('Send Verification Email'),
              ),
              const SizedBox(height: 10),
              const Text("Check your email and click on the"),
              const Text("confirmation link to continue.")
            ]),
          ),
        ),
      ),
    );
  }
}
