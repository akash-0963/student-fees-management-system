// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class CreateStudentPage extends StatefulWidget {
//
//   final String studentId;
//
//   const CreateStudentPage({super.key, required this.studentId});
//   @override
//   _CreateStudentPageState createState() => _CreateStudentPageState(studentId);
// }
//
// class _CreateStudentPageState extends State<CreateStudentPage> {
//   final String studentId;
//
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _rollNoController = TextEditingController();
//   var _branchController= TextEditingController();
//   var _batchController= TextEditingController();
//   final _prnNumberController = TextEditingController();
//   //final _emailController = TextEditingController();
//   // User? user = FirebaseAuth.instance.currentUser;
//   // String email = user?.email ?? '';
//   final _phoneNumberController = TextEditingController();
//   var _yearOfStudyController = TextEditingController();
//
//
//   _CreateStudentPageState(this.studentId);
//   // Define controllers for other student fields
//
//
//   late User? user;
//   late String email;
//
//   // Rest of your code...
//
//   @override
//   void initState() {
//     super.initState();
//     user = FirebaseAuth.instance.currentUser;
//     email = user?.email ?? '';
//   }
//
//   @override
//   void dispose() {
//     _nameController.dispose();
//     _rollNoController.dispose();
//     _batchController.dispose();
//     _branchController.dispose();
//     //_emailController.dispose();
//     _phoneNumberController.dispose();
//     _prnNumberController.dispose();
//     _yearOfStudyController.dispose();
//     super.dispose();
//   }
//
//   // void _createStudent() {
//   //   if (_formKey.currentState!.validate()) {
//   //     // Create a new document in the "students" collection
//   //     FirebaseFirestore.instance
//   //         .collection('students')
//   //         .doc(studentId)
//   //         .set({
//   //       'name': _nameController.text,
//   //       'rollNo': _rollNoController.text,
//   //       // 'branch': _branchController.text,
//   //       // 'batch': _batchController.text,
//   //       'branch': _branchController.toString(),
//   //       'batch': _batchController.toString(),
//   //       'prnNumber': _prnNumberController.text,
//   //       'email': _emailController.text,
//   //       'phoneNumber': _phoneNumberController.text,
//   //       // 'yearOfStudy': _yearOfStudyController.text,
//   //       'yearOfStudy': _yearOfStudyController.toString(),
//   //     }).then((value) {
//   //       // Document created successfully
//   //       // You can perform any desired actions here, such as showing a success message or navigating to another page
//   //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//   //         content: Text('Success'),
//   //         duration: Duration(seconds: 5),
//   //       ));
//   //       Navigator.pushReplacementNamed(context, '/home');
//   //
//   //     }).catchError((error) {
//   //         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//   //           content: Text('An error occurred. Please try again later.'),
//   //           duration: Duration(seconds: 5),
//   //         ));
//   //     });
//   //   }
//   // }
//
//
//
//   void _createStudent() {
//     if (_formKey.currentState!.validate()) {
//       // Create a new document in the "students" collection
//       FirebaseFirestore.instance
//           .collection('students')
//           .doc(studentId)
//           .set({
//         'name': _nameController.text,
//         'rollNo': _rollNoController.text,
//         'branch': _branchController.text,
//         'batch': _batchController.text,
//         'prnNumber': _prnNumberController.text,
//         'email': email.toString(),
//         'phoneNumber': _phoneNumberController.text,
//         'yearOfStudy': _yearOfStudyController.text,
//       }).then((value) {
//         // Document created successfully
//         // You can perform any desired actions here, such as showing a success message or navigating to another page
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Success'),
//             duration: Duration(seconds: 5),
//           ),
//         );
//         Navigator.pushReplacementNamed(context, '/home');
//       }).catchError((error) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('An error occurred. Please try again later.'),
//             duration: Duration(seconds: 5),
//           ),
//         );
//       });
//     }
//   }
//
//
//   String fetchUserEmail() {
//     User? user = FirebaseAuth.instance.currentUser;
//     String email;
//
//     return email = user?.email ?? '';
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create Student'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _nameController,
//                 decoration: InputDecoration(labelText: 'Name'),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter the name';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _rollNoController,
//                 decoration: InputDecoration(labelText: 'Roll No'),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter the roll number';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _prnNumberController,
//                 decoration: InputDecoration(labelText: 'PRN Number'),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter the PRN number';
//                   }
//                   return null;
//                 },
//               ),
//
//               TextFormField(
//                 controller: _batchController,
//                 decoration: InputDecoration(labelText: 'Batch'),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter the Batch';
//                   }
//                   return null;
//                 },
//               ),
//
//               // DropdownButton<String>(
//               //
//               //   value: _branchController = 'CS',
//               //
//               //   items: <String>['CS', 'CSBS', 'IT', 'ENTC', 'ET', 'ME', 'CE', 'AR']
//               //       .map<DropdownMenuItem<String>>((String value) {
//               //     return DropdownMenuItem<String>(
//               //       value: value,
//               //       child: Text(
//               //         value,
//               //         style: TextStyle(fontSize: 30),
//               //       ),
//               //     );
//               //   }).toList(),
//               //   // Step 5.
//               //   onChanged: (String? newValue) {
//               //     setState(() {
//               //       _branchController = newValue!;
//               //     });
//               //   },
//               // ),
//               //
//               TextFormField(
//                 controller: _branchController,
//                 decoration: InputDecoration(labelText: 'Branch'),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter the Branch';
//                   }
//                   return null;
//                 },
//               ),
//
//               // DropdownButton<String>(
//               //
//               //   value: _batchController,
//               //
//               //   items: <String>['18-22', '19-23', '20-24', '21-25']
//               //       .map<DropdownMenuItem<String>>((String value) {
//               //     return DropdownMenuItem<String>(
//               //       value: value,
//               //       child: Text(
//               //         value,
//               //         style: TextStyle(fontSize: 30),
//               //       ),
//               //     );
//               //   }).toList(),
//               //   // Step 5.
//               //   onChanged: (String? newValue) {
//               //     setState(() {
//               //       _batchController = newValue!;
//               //     });
//               //   },
//               // ),
//               //
//               //
//               TextFormField(
//                 controller: _yearOfStudyController,
//                 decoration: InputDecoration(labelText: 'Year Of Study'),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter the Year of Study';
//                   }
//                   return null;
//                 },
//               ),
//
//               //
//               // DropdownButton<String>(
//               //
//               //   value: _yearOfStudyController,
//               //
//               //   items: <String>['FY', 'SY', 'TY', 'Final Year']
//               //       .map<DropdownMenuItem<String>>((String value) {
//               //     return DropdownMenuItem<String>(
//               //       value: value,
//               //       child: Text(
//               //         value,
//               //         style: TextStyle(fontSize: 30),
//               //       ),
//               //     );
//               //   }).toList(),
//               //   // Step 5.
//               //   onChanged: (String? newValue) {
//               //     setState(() {
//               //       _yearOfStudyController = newValue!;
//               //     });
//               //   },
//               // ),
//
//
//               TextFormField(
//                 controller: _phoneNumberController,
//                 decoration: InputDecoration(labelText: 'Phone Number'),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter the Phone Number';
//                   }
//                   return null;
//                 },
//               ),
//               // // Add other form fields for student details
//               ElevatedButton(
//                 onPressed: _createStudent,
//                 child: Text('Create'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }












import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateStudentPage extends StatefulWidget {
  final String studentId;

  const CreateStudentPage({Key? key, required this.studentId}) : super(key: key);

  @override
  _CreateStudentPageState createState() => _CreateStudentPageState(studentId);
}

class _CreateStudentPageState extends State<CreateStudentPage> {
  final String studentId;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _rollNoController = TextEditingController();
  String _branchController = 'CS';// = TextEditingController();
  String _batchController = '21-25';// = TextEditingController();
  final _prnNumberController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  String _yearOfStudyController = 'FY';// = TextEditingController();
  late User? user;
  late String email;

  _CreateStudentPageState(this.studentId);

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    email = user?.email ?? '';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _rollNoController.dispose();
    // _branchController.dispose();
    // _batchController.dispose();
    _prnNumberController.dispose();
    _phoneNumberController.dispose();
    // _yearOfStudyController.dispose();
    super.dispose();
  }

  void _createStudent() {
    if (_formKey.currentState!.validate()) {
      FirebaseFirestore.instance
          .collection('students')
          .doc(studentId)
          .set({
        'name': _nameController.text,
        'rollNo': _rollNoController.text,
        'branch': _branchController.toString(),
        'batch': _batchController.toString(),
        'prnNumber': _prnNumberController.text,
        'email': email,
        'phoneNumber': _phoneNumberController.text,
        'yearOfStudy': _yearOfStudyController.toString(),
      }).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Success'),
            duration: Duration(seconds: 5),
          ),
        );
        Navigator.pushReplacementNamed(context, '/home');
      }).catchError((error) {
        String errorMessage = 'An error occurred. Please try again later.';
        if (error is FirebaseException) {
          switch (error.code) {
            case 'permission-denied':
              errorMessage = 'Insufficient permissions.';
              break;
            case 'invalid-argument':
              errorMessage = 'Invalid field value.';
              break;
            case 'unavailable':
              errorMessage = 'Network connectivity issue.';
              break;
            case 'already-exists':
              errorMessage = 'Document already exists.';
              break;
          // Add more cases for specific error codes if needed
          }
        } else if (error is FirebaseAuthException) {
          errorMessage = 'Authentication error. Please check your credentials.';
        } else if (error is PlatformException) {
          errorMessage = 'Platform error occurred. ${error.message}';
        } else if (error is SocketException) {
          errorMessage = 'Network error occurred. Please check your internet connection.';
        } else if (error is FormatException) {
          errorMessage = 'Format error occurred. Invalid data format.';
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            duration: Duration(seconds: 5),
          ),
        );
      });
    }
  }

  // void createStudentDocument() {
  //   FirebaseFirestore.instance
  //       .collection('students')
  //       .doc(studentId) // Replace 'document_id' with your desired document ID or use `.doc()` to let Firestore generate a random ID
  //       .set({
  //     'name': 'John Doe',
  //     'age': 20,
  //     'grade': 'A'
  //   })
  //       .then((value) {
  //     print('Document created successfully');
  //   })
  //       .catchError((error) {
  //     print('Failed to create document: $error');
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Student'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _rollNoController,
                decoration: InputDecoration(labelText: 'Roll No'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the roll number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _prnNumberController,
                decoration: InputDecoration(labelText: 'PRN Number'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the PRN number';
                  }
                  return null;
                },
              ),
              // TextFormField(
              //   controller: _batchController,
              //   decoration: InputDecoration(labelText: 'Batch'),
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return 'Please enter the Batch';
              //     }
              //     return null;
              //   },
              // ),

              DropdownButton<String>(

                value: _batchController,

                items: <String>['18-22', '19-23', '20-24', '21-25']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(fontSize: 30),
                    ),
                  );
                }).toList(),
                // Step 5.
                onChanged: (String? newValue) {
                  setState(() {
                    _batchController = newValue!;
                  });
                },
              ),



              // TextFormField(
              //   controller: _branchController,
              //   decoration: InputDecoration(labelText: 'Branch'),
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return 'Please enter the Branch';
              //     }
              //     return null;
              //   },
              // ),

              DropdownButton<String>(

                value: _branchController,

                items: <String>['CS', 'CSBS', 'IT', 'ENTC', 'ET', 'ME', 'CE', 'AR']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(fontSize: 30),
                    ),
                  );
                }).toList(),
                // Step 5.
                onChanged: (String? newValue) {
                  setState(() {
                    _branchController = newValue!;
                  });
                },
              ),

              // TextFormField(
              //   controller: _yearOfStudyController,
              //   decoration: InputDecoration(labelText: 'Year Of Study'),
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return 'Please enter the Year of Study';
              //     }
              //     return null;
              //   },
              // ),

              DropdownButton<String>(

                value: _yearOfStudyController,

                items: <String>['FY', 'SY', 'TY', 'Final Year']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(fontSize: 30),
                    ),
                  );
                }).toList(),
                // Step 5.
                onChanged: (String? newValue) {
                  setState(() {
                    _yearOfStudyController = newValue!;
                  });
                },
              ),

              TextFormField(
                controller: _phoneNumberController,
                decoration: InputDecoration(labelText: 'Phone Number'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the Phone Number';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: _createStudent,
                child: Text('Create'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
