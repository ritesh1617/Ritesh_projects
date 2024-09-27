import 'package:flutter/material.dart';
import 'package:resume_bulider/Templetscreen.dart';

class ResumeFormScreen extends StatefulWidget {
  @override
  _ResumeFormScreenState createState() => _ResumeFormScreenState();
}

class _ResumeFormScreenState extends State<ResumeFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String phone = '';
  String address = '';
  String education = '';
  String experience = '';
  String skills = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Create Your Resume', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Name Input
              buildTextField("Full Name", (value) => name = value),
              buildTextField("Email", (value) => email = value),
              buildTextField("Phone Number", (value) => phone = value),
              buildTextField("Address", (value) => address = value),
              buildTextField("Education", (value) => education = value),
              buildTextField("Experience", (value) => experience = value),
              buildTextField("Skills", (value) => skills = value),
              
              SizedBox(height: 20),

              // Submit Button with animation
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Navigate to template selection screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TemplateScreen(
                          name: name,
                          email: email,
                          phone: phone,
                          address: address,
                          education: education,
                          experience: experience,
                          skills: skills,
                        ),
                      ),
                    );
                  }
                },
                child: Text('Next', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper to build text fields
  Widget buildTextField(String label, Function(String) onSave) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.grey.shade100,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) return "Please enter $label";
          return null;
        },
        onSaved: (value) => onSave(value!),
      ),
    );
  }
}
