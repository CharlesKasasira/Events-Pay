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
    //
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
            Text("Events", style: TextStyle(color: Colors.white)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Handle search button press
            },
          ),
          CircleAvatar(
            backgroundImage: AssetImage("assets/profile_image.jpg"),
          ),
        ],
      ),
      body: Column(
        children: [
          // Major Events Heading
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Major Events",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    // Handle search button press
                  },
                ),
              ],
            ),
          ),
          // Horizontal Image List View
          Container(
            height: 150, // Adjust the height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: events.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      children: [
                        Image.asset(
                          events[index].eventImage,
                          width: 200, // Adjust the width as needed
                          height: 150, // Adjust the height as needed
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          bottom: 2,
                          child: Container(
                            width: 200, // Adjust the width as needed
                            height: 2,
                            color: Colors.white,
                            child: Row(
                              children: [
                                // White dots here
                                // You can use a loop to generate white dots based on the length of the list view
                                for (int i = 0; i < events.length; i++)
                                  Container(
                                    width: 6,
                                    height: 6,
                                    margin: EdgeInsets.symmetric(horizontal: 2),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: i == index ? Colors.white : Colors.grey,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Events List Heading
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Events List",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Your Existing List View with Black Lines
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black45,
                  width: 1.0,
                ),
              ),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: events.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.all(16),
                      leading: Image.asset(events[index].eventImage),
                      title: Text(
                        events[index].eventName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Row(
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
                      },
                      // Handle item click
                    ),
                    Divider(
                      color: Colors.black45,
                      height: 1.0,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      drawer: const MyDrawer(),
    );
  }
}



