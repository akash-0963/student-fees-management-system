import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentsPortalPage extends StatefulWidget {
  @override
  _PaymentsPortalPageState createState() => _PaymentsPortalPageState();
}

class _PaymentsPortalPageState extends State<PaymentsPortalPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Razorpay _razorpay = Razorpay();

  String _amount = '';
  String _prnNumber = '';
  String _yearOfStudy = '';
  String _batch = '';

  @override
  void initState() {
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  void _openPaymentGateway() {
    var options = {
      'key': 'rzp_test_vsRyDyfayTyjys',
      'amount': int.parse(_amount) * 100, // Amount in paise
      'name': 'Your App Name',
      'description': 'Payment for Fees',
      'prefill': {'contact': '', 'email': ''}, // Pre-filled user details
      'external': {
        'wallets': ['paytm'] // Supported wallet options
      }
    };

    _razorpay.open(options);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Payment successful
    String? paymentId = response.paymentId;
    String? orderId = response.orderId;

    // Store payment details in Firestore
    _firestore.collection('payments').doc(orderId).set({
      'amount': _amount,
      'prnNumber': _prnNumber,
      'yearOfStudy': _yearOfStudy,
      'batch': _batch,
      'timestamp': DateTime.now(),
    }).then((value) {
      // Payment details stored successfully
      // Perform any additional actions here
    }).catchError((error) {
      // Error occurred while storing payment details
      // Handle the error accordingly
    });

    // TODO: Navigate to success page or perform any post-payment actions
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Payment failed
    // Handle the error accordingly
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // External wallet selected
    // Handle the external wallet payment accordingly
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payments Portal'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              onChanged: (value) {
                setState(() {
                  _amount = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'PRN Number'),
              onChanged: (value) {
                setState(() {
                  _prnNumber = value;
                });
              },
            ),
            // TextField(
            //   decoration: InputDecoration(labelText: 'Year of Study'),
            //   onChanged: (value) {
            //     setState(() {
            //       _yearOfStudy = value;
            //     });
            //   },
            // ),
            // TextField(
            //   decoration: InputDecoration(labelText: 'Batch'),
            //   onChanged: (value) {
            //     setState(() {
            //       _batch = value;
            //     });
            //   },
            // ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _openPaymentGateway,
              child: Text('Make Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
