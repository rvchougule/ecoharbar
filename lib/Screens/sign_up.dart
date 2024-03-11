import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_managemet_app/Controllers/SignUp/signup_controller.dart';
import 'package:waste_managemet_app/Screens/login.dart';




class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _navigateToOtpVerification(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Signup_Controller()),
    );
  }

  Future<void> _signUp() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);
      print('User signed up: ${userCredential.user}');
    } catch (e) {
      print('Error signing up: $e');
    }
    Get.offAll(const Signup_Controller());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              IconButton(
                  padding: const EdgeInsets.only(right: 25),
                  onPressed: () {
                    Navigator.pop(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Login()));
                  },
                  icon: const Icon(
                    Icons.arrow_back_sharp,
                    size: 30,
                    color: Colors.black,
                  )),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Welcome to",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color(0xff5da646),
                  fontSize: 26,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "EcoHarbor",
                style: TextStyle(
                    fontFamily: "Lato",
                    color: Color(0xff1d2d47),
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Name",
                style: TextStyle(
                    fontFamily: "Sans Serif Collection",
                    fontSize: 16,
                    color: Color(0x7f1d2d47)),
              ),
              const TextField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    hintText: "Name", prefixIcon: Icon(Icons.account_circle)),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Email",
                style: TextStyle(
                    fontFamily: "Sans Serif Collection",
                    fontSize: 16,
                    color: Color(0x7f1d2d47)),
              ),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    hintText: "Email", prefixIcon: Icon(Icons.email)),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Password",
                style: TextStyle(
                    fontFamily: "Sans Serif Collection",
                    fontSize: 16,
                    color: Color(0x7f1d2d47)),
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    hintText: "Password", prefixIcon: Icon(Icons.lock)),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _navigateToOtpVerification(context);
                    _signUp();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(93, 166, 70, 1),
                      minimumSize: const Size(280, 50)),
                  child: const Text(
                    "Proceed",
                     style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
