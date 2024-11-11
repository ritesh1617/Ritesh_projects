import 'package:flutter/material.dart';

class Q66 extends StatefulWidget {
  @override
  _Q66State createState() => _Q66State();
}

class _Q66State extends State<Q66> {
  DateTime? selectedDate;

  // Function to open the date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Date Picker Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text("Select Date"),
            ),
            SizedBox(height: 20),
            Text(
              selectedDate == null
                  ? "No date selected"
                  : "Selected Date: ${selectedDate!.toLocal()}".split(' ')[0],
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
