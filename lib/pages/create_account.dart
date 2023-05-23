import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'fill_stu_details.dart';


class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _createAccount() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Create a user account with email and password
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        // Account created successfully
        // You can perform any desired actions here, such as showing a success message or navigating to another page
        final User? user = await FirebaseAuth.instance.currentUser;
        String uid = user?.uid ?? '';
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreateStudentPage(studentId: uid),
          ),
        );
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   content: Text('Success ' + uid + ' created'),
        //   duration: Duration(seconds: 5),
        // ));
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('An error occurred. Please try again later.'),
          duration: Duration(seconds: 5),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: _createAccount,
                  child: Text('Create Account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
