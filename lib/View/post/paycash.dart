import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PayCash extends StatefulWidget {
  final String upiId; // UPI ID for the payment
  final double amount; // Amount to be paid
  final String regId; // Registration ID for tracking payment
  
  const PayCash({
    super.key,
    required this.upiId,
    required this.amount,
    required this.regId,
  });

  @override
  State<PayCash> createState() => _PayCashState();
}

class _PayCashState extends State<PayCash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'UPI ID: ${widget.upiId}', // Display UPI ID
              style: const TextStyle(fontSize: 18,color: Colors.amberAccent),
            ),
            const SizedBox(height: 20),
            Text(
              'Amount: ₹${widget.amount.toStringAsFixed(2)}', // Display amount
              style: const TextStyle(fontSize: 18,color: Colors.amberAccent),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Implement payment functionality here
                // You can launch the payment app or any other logic
                _initiatePayment();
              },
              child: const Text('Pay Now'),
            ),
          ],
        ),
      ),
    );
  }

  void _initiatePayment() {
    
    final url = 'upi://pay?pa=${widget.upiId}&am=${widget.amount.toStringAsFixed(2)}&cu=INR&url=https://example.com';
    
 
    _launchUrl(url);
  }

  void _launchUrl(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
  }
}
