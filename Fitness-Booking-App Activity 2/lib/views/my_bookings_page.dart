import 'package:flutter/material.dart';
import '../services/booking_service.dart';
import '../models/instructor.dart';

class MyBookingsPage extends StatelessWidget {
  const MyBookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Bookings")),
      body: ListView.builder(
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          final booking = bookings[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Instructor name + booking date
                Text(
                  "${booking.instructor.name} • ${booking.date.toLocal()}"
                      .split(' ')[0],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),

                // Chat bubble for booking details
                Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "Booking at ${booking.time}, Rate: ₱${booking.rate}/hr",
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                const Divider(),
              ],
            ),
          );
        },
      ),
    );
  }
}
