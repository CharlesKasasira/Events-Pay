import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:packingticketingsystem/screens/ticket_screen.dart';
import 'package:packingticketingsystem/screens/events_screen.dart';


class Events_Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back,color: Colors.white),
              onPressed: () {
                Get.off(() => EventsScreen());
                // Handle back button press
              },
            ),
            Text("Event Details",style: TextStyle(color: Colors.white)),
          ],
        ),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/profile_image.jpg"),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Replace "Major events" text with a rounded image
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset("assets/images/hajat.jpg",
                width: double.infinity,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "eventName",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "eventDate",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              "at eventLocation",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Ticket Prices",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTicketPriceRow("Bronze", "\$100"),
                  _buildTicketPriceRow("Silver", "\$75"),
                  _buildTicketPriceRow("Gold", "\$50"),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // push to make payment screen but for testing pushing it to ticket screen
                  Get.off(() => TicketScreen());
                  // Handle button press
                },
                child: Text("Make Payment"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTicketPriceRow(String name, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(value),
        ],
      ),
    );
  }
}
