import 'package:flutter/material.dart';
import 'package:packingticketingsystem/screens/event_details.dart';
import 'package:packingticketingsystem/widgets/drawer.dart';
import 'package:get/get.dart';


// void main() {
//   runApp(MyApp());
// }

class Event {
  final String eventName;
  final String eventImage;
  final String eventDate;
  final String eventLocation;

  Event({
    required this.eventName,
    required this.eventImage,
    required this.eventDate,
    required this.eventLocation,
  });
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyScreen(),
//     );
//   }
// }

class EventsScreen extends StatelessWidget {
  final List<Event> events = [
    Event(
      eventName: "PowerHajjat Expo",
      eventImage: "assets/images/hajat.jpg",
      eventDate: "4/5/2024",
      eventLocation: "UMA Exhibition Hall",
    ),
    Event(
      eventName: "Meat and Loaf",
      eventImage: "assets/images/meatandloaf.jpg",
      eventDate: "12/04/2023",
      eventLocation: "Lugogo Cricket  Oval",
    ),
    // Add more events as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
            Text("Events",style: TextStyle(color: Colors.white)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search,color: Colors.white),
            onPressed: () {
              // Handle search button press
            },
          ),
          CircleAvatar(
            backgroundImage: AssetImage("assets/profile_image.jpg"),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.all(16),
            leading: Image.asset(events[index].eventImage),
              // (events[index].eventImage),
            title: Text(
              events[index].eventName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(events[index].eventDate),
                Text(
                  events[index].eventLocation,
                  style: TextStyle(color: Colors.green),
                ),
              ],
            ),
            onTap: () {
              Get.off(() => Events_Details(), arguments: events[index]);
              }
              // Handle item click

          );
        },
      ),
      drawer: const MyDrawer(),
    );
  }
}
