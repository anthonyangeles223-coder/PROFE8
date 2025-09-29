import 'package:flutter/material.dart';
import '../models/instructor.dart';
import '../services/mock_data.dart';
import '../widgets/custom_button.dart';
import 'my_bookings_page.dart';
import 'instructor_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedLocation = "All";
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fitness Instructor Booking"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text("Menu",
                  style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ...["All", "Bacolod", "Talisay", "Silay"].map((loc) => ListTile(
                  title: Text(loc == "All" ? "All Instructors" : loc),
                  onTap: () {
                    setState(() => selectedLocation = loc);
                    _currentIndex = 0; // ensure Home tab is active
                    Navigator.pop(context);
                  },
                )),
            const Divider(),
            ListTile(
              title: const Text("My Bookings"),
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _currentIndex == 0
          ? _homeContent()
          : _currentIndex == 1
              ? const MyBookingsPage()
              : _profilePage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: "Bookings"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  // Home Content
  Widget _homeContent() {
    List<Instructor> filteredInstructors = selectedLocation == "All"
        ? mockInstructors
        : mockInstructors.where((i) => i.location == selectedLocation).toList();

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Feature 1: Row with stats
          Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 6),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text("Total: 12",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("New: 3", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Top Rated: 2",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),

          // Feature 7: Stack banner with floating button
          Stack(
            children: [
              Container(
                height: 120,
                margin: const EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(12)),
                child: const Center(
                    child: Text("Welcome to Fitness Booking",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600))),
              ),
            ],
          ),

          // Feature 10: Grid-like layout using Row+Column
          Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 6),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _categoryBox("Yoga", Colors.green[100]!),
                      _categoryBox("Cardio", Colors.green[200]!),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _categoryBox("Strength", Colors.green[300]!),
                      _categoryBox("Pilates", Colors.green[400]!),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 8),

          // Instructor List
          Expanded(
            child: ListView.builder(
              itemCount: filteredInstructors.length,
              itemBuilder: (context, index) {
                final instructor = filteredInstructors[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    leading: CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(instructor.imageUrl)),
                    title: Text(instructor.name,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(
                        "${instructor.expertise} • ${instructor.location}"),
                    trailing: CustomButton(
                      text: "View",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => InstructorDetailsPage(
                                    instructor: instructor)));
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Profile Page
  static Widget _profilePage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircleAvatar(
            radius: 50,
            backgroundImage:
                NetworkImage("https://www.w3schools.com/w3images/avatar2.png"),
          ),
          SizedBox(height: 12),
          Text("John Doe",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text("Fitness Enthusiast"),
          SizedBox(height: 8),
          Text("Email: john.doe@example.com"),
        ],
      ),
    );
  }

  // Category Box
  Widget _categoryBox(String title, Color color) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("$title category clicked")));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(12)),
        child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
