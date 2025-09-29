import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            Text(
              "About This App",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text(
              "This is a Fitness Instructor Booking App demo. It showcases instructor profiles, booking system, and layout exercises from your Flutter course.",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
