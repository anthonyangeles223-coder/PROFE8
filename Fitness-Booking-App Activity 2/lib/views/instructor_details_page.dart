import 'package:flutter/material.dart';
import '../models/instructor.dart';
import 'booking_page.dart';
import '../widgets/custom_button.dart';

class InstructorDetailsPage extends StatelessWidget {
  final Instructor instructor;

  const InstructorDetailsPage({super.key, required this.instructor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(instructor.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile card with Row + Column
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(instructor.imageUrl),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(instructor.name,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Text(instructor.expertise),
                          Text(instructor.location),
                          const SizedBox(height: 8),
                          Row(
                            children: const [
                              Icon(Icons.star, color: Colors.amber, size: 18),
                              Icon(Icons.star, color: Colors.amber, size: 18),
                              Icon(Icons.star, color: Colors.amber, size: 18),
                              Icon(Icons.star_half,
                                  color: Colors.amber, size: 18),
                              Icon(Icons.star_border,
                                  color: Colors.amber, size: 18),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Two functional buttons in a Column
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomButton(
                  text: "Book Now",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                BookingPage(instructor: instructor)));
                  },
                  backgroundColor: Colors.green,
                ),
                const SizedBox(height: 12),
                CustomButton(
                  text: "Message Instructor",
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Messaging not implemented yet")));
                  },
                  backgroundColor: Colors.blue,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
