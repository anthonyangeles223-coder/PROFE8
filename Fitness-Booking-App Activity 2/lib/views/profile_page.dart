import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile / About")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile picture
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                  "https://www.w3schools.com/howto/img_avatar.png"), // reliable placeholder
            ),
            const SizedBox(height: 16),
            const Text(
              "Tony Stark",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Fitness Enthusiast & App User",
              style: TextStyle(color: Colors.grey[700]),
            ),
            const SizedBox(height: 24),

            // About section
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "About the App",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "This Fitness Instructor Booking app allows users to view instructors, book sessions, and track bookings. "
                      "Features include a profile page, booking management, and responsive UI layouts.",
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Contact Info
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Contact Info",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text("Email: johndoe@example.com"),
                    Text("Phone: +63 912 345 6789"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
