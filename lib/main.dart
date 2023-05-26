import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_project/pages/create_account.dart';
import 'package:my_project/pages/fill_stu_details.dart';
import 'package:my_project/pages/home_page.dart';
import 'package:my_project/pages/payments_page.dart';
import 'firebase_options.dart';
import 'package:my_project/pages/landing_page.dart';
import 'package:my_project/pages/login_page.dart';


Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Fees Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => LandingPage(), // LandingPage as the initial route
        '/login': (context) => LoginScreen(), // Replace with your own login screen
        '/home': (context) => StudentHome(),
        '/create-account': (context) => CreateAccountPage(),
        '/payments': (context) => PaymentsPortalPage(),
       // '/registration': (context) => RegistrationScreen(), // Replace with your own registration screen
      },
    );
  }
}
