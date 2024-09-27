import 'package:flutter/material.dart';
import 'package:resume_bulider/previewscreen.dart';

class TemplateScreen extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String address;
  final String education;
  final String experience;
  final String skills;

  TemplateScreen({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.education,
    required this.experience,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select a Template")),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 3, // Number of templates
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PreviewScreen(
                    name: name,
                    email: email,
                    phone: phone,
                    address: address,
                    education: education,
                    experience: experience,
                    skills: skills,
                    templateIndex: index,
                  ),
                ),
              );
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Template ${index + 1}", style: TextStyle(fontSize: 18)),
                  SizedBox(height: 10),
                  Icon(Icons.description, size: 50, color: Colors.teal),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
