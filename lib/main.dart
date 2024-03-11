import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:waste_managemet_app/firebase_options.dart';
import 'Screens/login.dart';

void main() async {
  //initialize the firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[700], // Green primary color
        primaryColorLight: Colors.green[300], // Light green accent color
        scaffoldBackgroundColor: Colors.white, // White background
      ),
      debugShowCheckedModeBanner: false,
      home: const Login(),
    );
  }
}
