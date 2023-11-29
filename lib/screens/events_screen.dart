import 'package:flutter/material.dart';
import 'package:packingticketingsystem/screens/event_details.dart';
import 'package:packingticketingsystem/utils/constants.dart';
import 'package:packingticketingsystem/widgets/appbar_avatar.dart';
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
        shadowColor: const Color.fromARGB(100, 158, 158, 158),
        backgroundColor: const Color(0xff1a1a1a),
        elevation: 0,
        foregroundColor: Colors.white,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Events",style: TextStyle(color: Colors.white)),
            SizedBox(
              width: 10,
            ),
            AppBarAvatar()
          ],
        ),
      ),
      body: Column(
        children: [
          // Major Events Heading
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
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
          ),

          const SizedBox(height: 16,),


          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 400,
              color: Colors.white,
              child: ListView(
                children: [
                  ListTile(
                    title: Text("Events List", style: TextStyle(fontSize: 18),),
                  ),
                  Divider( thickness: 1,),
                  InkWell(
                    onTap: () {
                      Get.to(
                        () => Events_Details(),
                        transition: Transition.cupertino,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeOut,
                      );
                    },
                    child: Ink(
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset("assets/images/xmascantanta.jpg", width: 56, height: 56,)),
                        title: Text("Christmas Cantant", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                        subtitle: Row(
                          children: [
                            Text("12/12/2023"),
                            SizedBox(width: 8,),
                            Text("Watoto", style: TextStyle(color: kGreen),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(
                        () => Events_Details(),
                        transition: Transition.cupertino,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeOut,
                      );
                    },
                    child: Ink(
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset("assets/images/meatandloaf.jpg")),
                        title: Text("Meat and Loaf", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                        subtitle: Row(
                          children: [
                            Text("12/04/2023"),
                            SizedBox(width: 8,),
                            Text("Lugogo cricket Oval", style: TextStyle(color: kGreen),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(
                        () => Events_Details(),
                        transition: Transition.cupertino,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeOut,
                      );
                    },
                    child: Ink(
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset("assets/images/youth.jpg", width: 56, height: 56,)),
                        title: Text("Munyigo Pro Max", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                        subtitle: Row(
                          children: [
                            Text("01/01/2024"),
                            SizedBox(width: 8,),
                            Text("Uganda Museum", style: TextStyle(color: kGreen),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



