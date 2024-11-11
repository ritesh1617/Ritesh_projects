import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController _firstNumberController = TextEditingController();
  final TextEditingController _secondNumberController = TextEditingController();

  void _navigateToResultScreen(BuildContext context) {
    final int? firstNumber = int.tryParse(_firstNumberController.text);
    final int? secondNumber = int.tryParse(_secondNumberController.text);

    if (firstNumber != null && secondNumber != null) {
      final int sum = firstNumber + secondNumber;

      // Navigate to ResultScreen and pass the sum
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultScreen(sum: sum)),
      );
    } else {
      // Show an alert if input is invalid
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Invalid Input"),
          content: Text("Please enter valid numbers."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Two Numbers"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _firstNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter first number",
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _secondNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter second number",
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _navigateToResultScreen(context),
              child: Text("Calculate Sum"),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final int sum;

  ResultScreen({required this.sum});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: Center(
        child: Text(
          "The sum is: $sum",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
