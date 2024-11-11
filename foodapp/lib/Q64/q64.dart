import 'package:flutter/material.dart';

class Q64 extends StatefulWidget {
  @override
  _Q64State createState() => _Q64State();
}

class _Q64State extends State<Q64> {
  List<String> cities = [
    "New York",
    "Los Angeles",
    "Chicago",
    "Houston",
    "Phoenix"
  ];
  String? selectedCity;

  void _showCityDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select a City"),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: cities.length,
              itemBuilder: (BuildContext context, int index) {
                return RadioListTile<String>(
                  title: Text(cities[index]),
                  value: cities[index],
                  groupValue: selectedCity,
                  onChanged: (String? value) {
                    setState(() {
                      selectedCity = value;
                    });
                    Navigator.of(context)
                        .pop(); // Close the dialog after selection
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("City Selection Dialog"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _showCityDialog,
              child: Text("Select City"),
            ),
            SizedBox(height: 20),
            Text(
              selectedCity == null
                  ? "No city selected"
                  : "Selected City: $selectedCity",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
