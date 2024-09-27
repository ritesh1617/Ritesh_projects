import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PreviewScreen extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String address;
  final String education;
  final String experience;
  final String skills;
  final int templateIndex;

  PreviewScreen({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.education,
    required this.experience,
    required this.skills,
    required this.templateIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Resume Preview')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: templateIndex == 0 ? buildTemplateOne() : buildTemplateTwo(),
            ),
            ElevatedButton(
              onPressed: () => downloadResume(),
              child: Text('Download Resume'),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTemplateOne() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text(email, style: TextStyle(fontSize: 18)),
        // Display other sections like experience, skills
      ],
    );
  }

  Widget buildTemplateTwo() {
    // Different layout for Template 2
    return Container();
  }

  void downloadResume() async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(name, style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
            pw.Text(email, style: pw.TextStyle(fontSize: 18)),
            // Add more sections
          ],
        ),
      ),
    );
    await Printing.layoutPdf(onLayout: (format) => pdf.save());
  }
}
