import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:packingticketingsystem/screens/ticket_screen.dart';
import 'package:packingticketingsystem/screens/events_screen.dart';

class PaidTicketScreen extends StatelessWidget {
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
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Get.off(() => EventsScreen());
                // Handle back button press
              },
            ),
            Text("Paid Events", style: TextStyle(color: Colors.white)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search,color: Colors.white,),
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
                Get.off(() => TicketScreen(), arguments: events[index]);
              }
            // Handle item click

          );
        },
      ),
    );
  }
}