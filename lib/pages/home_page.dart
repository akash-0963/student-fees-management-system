import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'stu_dash.dart';

class StudentHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    final String studentId = user?.uid ?? '';

    return StudentDashboard(studentId: studentId);
  }
}
