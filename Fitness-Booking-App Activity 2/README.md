# Fitness Instructor Booking App

This Flutter project is a web application that allows users to browse, view details, and book fitness instructors. It demonstrates state management, navigation, and dynamic UI rendering using Flutter widgets.

The app has been tested on a **web emulator**, so it can run directly in a browser without installing on a mobile device.

---

## Project Structure

```
lib/
├── main.dart
├── models/
│   └── instructor.dart
├── services/
│   └── mock_data.dart
├── views/
│   ├── front_page.dart
│   ├── my_bookings_page.dart
│   ├── home_page.dart
│   ├── instructor_details_page.dart
│   ├── booking_page.dart
│   └── material_cupertino_page.dart
├── widgets/
│   └── custom_button.dart
```

---

### **Explanation of Structure**

1. **`main.dart`**
   - Entry point of the application.
   - Sets up the main `MaterialApp` and home page.

2. **`models/`**
   - Contains data classes (like `Instructor`) to represent app data.
   - Keeps the data structure organized and separate from UI code.

3. **`services/`**
   - Stores mock data or services that provide data.
   - Facilitates testing and future integration with APIs.

4. **`views/`**
   - Contains all screen pages (HomePage, InstructorDetailsPage, BookingPage, etc.).
   - Separates UI components for each screen for clarity and maintainability.

5. **`widgets/`**
   - Contains reusable widgets like `CustomButton`.
   - Promotes reusability and keeps UI code DRY (Don't Repeat Yourself).

---

### **Reasoning for Arrangement**

- **Separation of Concerns:** Data (`models`), UI (`views`), services (`services`), and reusable components (`widgets`) are kept in separate folders. This makes the project easier to maintain and scale.  
- **Scalability:** Adding new features (like search, filtering, or payments) can be done without affecting existing code.  
- **Readability:** Developers can quickly find the purpose of each file and navigate the project structure.  

---

### **How to Run on Web Emulator**

1. Make sure you have Flutter installed: [Flutter installation guide](https://flutter.dev/docs/get-started/install)  
2. Clone this repository.  
3. Run the app in web mode:

```bash
flutter pub get
flutter run -d chrome
```

> The app will open in your default browser using the Flutter web emulator.

---

### **Future Improvements**

- Integrate a real backend for bookings.  
- Add user authentication.  
- Implement notifications for booking confirmations.  

---

### **Summary**

This project structure separates data, UI, and services to make the app maintainable, readable, and scalable. It provides a clear flow from browsing instructors to booking them and works fully on the web emulator.

---

## Widget Tree Diagram (ASCII Version)

```
HomePage (StatefulWidget)
├── Scaffold
│   ├── AppBar
│   │   └── Text("Fitness Instructor Booking")
│   ├── Drawer
│   │   └── ListView
│   │       ├── DrawerHeader
│   │       ├── ListTile("All Instructors")
│   │       ├── ListTile("Bacolod")
│   │       ├── ListTile("Talisay")
│   │       ├── ListTile("Silay")
│   │       ├── Divider
│   │       ├── ListTile("My Bookings")
│   │       └── ListTile("Material vs Cupertino Demo")
│   └── Body (ListView.builder)
│       └── Card (for each instructor)
│           ├── ListTile
│           │   ├── CircleAvatar (instructor image)
│           │   ├── Text (instructor name)
│           │   ├── Text (expertise & location)
│           │   └── CustomButton ("View") -> navigates to InstructorDetailsPage

InstructorDetailsPage (StatelessWidget)
├── Scaffold
│   ├── AppBar -> Text(instructor.name)
│   └── Body (Padding -> Column)
│       ├── Image.network (instructor.imageUrl)
│       ├── Text (instructor.name)
│       ├── Text (instructor.expertise)
│       ├── Text (instructor.location)
│       ├── Text (instructor.description)
│       └── ElevatedButton ("Book Now") -> navigates to BookingPage

BookingPage (StatefulWidget)
├── Scaffold
│   ├── AppBar -> Text("Book {instructor.name}")
│   └── Body (Padding -> Column)
│       ├── Text (instructor name, expertise, location)
│       ├── Text (Rate per hour)
│       ├── Row
│       │   ├── Text (selected date)
│       │   └── CustomButton ("Pick Date")
│       ├── Row
│       │   ├── Text (selected time)
│       │   └── CustomButton ("Pick Time")
│       └── CustomButton ("Confirm Booking") -> adds booking to list
```

### **Hierarchy Explanation**

1. **HomePage**
   - Scaffold is the main parent.
   - AppBar, Drawer, and Body are children.
   - Body dynamically generates Cards, each containing ListTile with CircleAvatar, Text, and CustomButton.

2. **InstructorDetailsPage**
   - Scaffold as parent.
   - Body uses Column to stack Image, Texts, and Button vertically.

3. **BookingPage**
   - Scaffold as parent.
   - Column in Body contains Texts, Rows for date/time pickers, and Confirm Button.
   - Rows allow horizontal alignment for buttons next to Texts.


