import 'package:intl/intl.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class StudentDashboard extends StatefulWidget {
//   final String studentId;
//
//   StudentDashboard({required this.studentId});
//
//   @override
//   State<StudentDashboard> createState() => _StudentDashboardState();
// }
//
// class _StudentDashboardState extends State<StudentDashboard> {
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Student Dashboard'),
//       ),
//       body: FutureBuilder<DocumentSnapshot>(
//         future: FirebaseFirestore.instance.collection('students').doc(widget.studentId).get(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//
//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }
//
//           if (!snapshot.hasData || snapshot.data == null) {
//             return Center(child: Text('No student data found.'));
//           }
//
//           var studentData = snapshot.data!.data() as Map<String, dynamic>;
//
//           return _buildStudentDashboard(studentData);
//         },
//       ),
//     );
//   }
//
//   Widget _buildStudentDashboard(Map<String, dynamic> studentData) {
//     return Padding(
//       padding: EdgeInsets.all(20.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Student Details',
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 10),
//           Text('Name: ${studentData['name']}'),
//           Text('Roll No: ${studentData['rollNo']}'),
//           Text('Branch: ${studentData['branch']}'),
//           Text('Year of Study: ${studentData['yearOfStudy']}'),
//           Text('Batch: ${studentData['batch']}'),
//           Text('PRN Number: ${studentData['prnNumber']}'),
//           Text('Phone Number: ${studentData['phoneNumber']}'),
//           Text('Email: ${studentData['email']}'),
//           SizedBox(height: 20),
//           Text(
//             'Outstanding Fees',
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           Text('Amount: ${studentData['outstandingFees']}'),
//           SizedBox(height: 20),
//           Text(
//             'Payment History',
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           if (studentData['paymentHistory'] == null || studentData['paymentHistory'].isEmpty)
//             Text('No payment history available.'),
//           for (String payment in studentData['paymentHistory'] ?? [])
//             Text(payment),
//           SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   // Handle fee submission action
//                 },
//                 child: Text('Submit Fee'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   // Handle payment history action
//                 },
//                 child: Text('Payment History'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_project/pages/payments_page.dart';

class StudentDashboard extends StatefulWidget {
  final String studentId;

  StudentDashboard({required this.studentId});

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Student Dashboard'),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection('students').doc(widget.studentId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No student data found.'));
          }

          var studentData = snapshot.data!.data() as Map<String, dynamic>;

          return _buildStudentDashboard(studentData);
        },
      ),
    );
  }

  Widget _buildStudentDashboard(Map<String, dynamic> studentData) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Student Details',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text('Name: ${studentData['name']}'),
          Text('Roll No: ${studentData['rollNo']}'),
          Text('Branch: ${studentData['branch']}'),
          Text('Year of Study: ${studentData['yearOfStudy']}'),
          Text('Batch: ${studentData['batch']}'),
          Text('PRN Number: ${studentData['prnNumber']}'),
          Text('Phone Number: ${studentData['phoneNumber']}'),
          Text('Email: ${studentData['email']}'),
          SizedBox(height: 20),
          Text(
            'Outstanding Fees',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text('Amount: ${studentData['outstandingFees']}'),
          SizedBox(height: 20),
          Text(
            'Payment History',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          if (studentData['paymentHistory'] == null || studentData['paymentHistory'].isEmpty)
            Text('No payment history available.'),
          for (String paymentId in studentData['paymentHistory'] ?? [])
            StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance.collection('payments').doc(paymentId).snapshots(),
              builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error fetching payment details');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }

                if (!snapshot.hasData || !snapshot.data!.exists) {
                  return Text('Payment document not found');
                }

                DocumentSnapshot paymentDoc = snapshot.data!;
                String paymentId = paymentDoc.id;
                String amount = paymentDoc.get('amount').toString();
                // //String time = paymentDoc.get('time').toString();
                Timestamp timestamp = paymentDoc.get('time');
                // DateTime dateTime = timestamp.toDate();
                //String formattedDateTime = DateFormat('HH:mm:ss').format(dateTime);
                String formatDateAndTime(Timestamp timestamp) {
                  DateTime dateTime = timestamp.toDate().toLocal();
                  DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
                  String formattedDateTime = formatter.format(dateTime);
                  return formattedDateTime;
                }

                String formattedDateTime = formatDateAndTime(timestamp);
                return ListTile(
                  title: Text('Payment ID: $paymentId'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Amount: $amount'),
                      Text('Time: $formattedDateTime'),
                    ],
                  ),
                );
              },
            ),

          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/payments');
                },
                child: Text('Submit Fee'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle payment history action
                },
                child: Text('Payment History'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}